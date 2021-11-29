extends KinematicBody2D

export var m_fWalkSpeed: float = 100
export var m_iHP: int = 3

onready var m_bIsDead: bool = false

onready var m_nAnimPlayer: AnimationPlayer = $AnimationPlayer
onready var m_nEatBox: Area2D = $EatBox

func _ready():
	m_nAnimPlayer.connect("animation_finished", self, "_on_anim_finished")
	m_nAnimPlayer.play("Walk")

func _physics_process(delta):
	if !m_bIsDead:
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
