extends KinematicBody2D

export var m_fWalkSpeed: float = 100
export var m_iHP: int = 3
export var m_fEatTime: float = 1.5

onready var m_bIsDead: bool = false
onready var m_bIsEating: bool = false
onready var m_nPlantBeingEat: Area2D = null

onready var m_nAnimPlayer: AnimationPlayer = $AnimationPlayer
onready var m_nEatBox: Area2D = $EatBox
onready var m_nEatTimer: Timer = $EatTimer

func _ready():
	m_nAnimPlayer.connect("animation_finished", self, "_on_anim_finished")
	m_nAnimPlayer.play("Walk")
	m_nEatBox.connect("area_entered", self, "_on_plant_in_range")
	m_nEatTimer.connect("timeout", self, "_on_finish_eating")

func _physics_process(delta):
	if m_bIsEating:
		if !m_nPlantBeingEat:
			m_bIsEating = false
			m_nAnimPlayer.play("Walk")
	elif !m_bIsDead:
		move_and_collide(Vector2.LEFT * m_fWalkSpeed * delta)

func take_damage(_iAmount: int):
	if !m_bIsDead:
		m_iHP -= _iAmount
		if m_iHP <= 0:
			m_bIsDead = true
			m_nAnimPlayer.play("Die")

func _on_anim_finished(_sAnimName: String):
	if _sAnimName == "Die":
		queue_free()

func _on_plant_in_range(_nPlant: Area2D):
	m_bIsEating = true
	m_nPlantBeingEat = _nPlant
	m_nAnimPlayer.play("Eat")
	m_nEatTimer.start(m_fEatTime)

func _on_finish_eating():
	m_nPlantBeingEat.queue_free()
	m_bIsEating = false
	m_nAnimPlayer.play("Walk")
