extends KinematicBody2D

export var m_fWalkSpeed: float = 100

onready var m_nAnimPlayer: AnimationPlayer = $AnimationPlayer
onready var m_nEatBox: Area2D = $EatBox

func _ready():
	m_nAnimPlayer.play("Walk")

func _physics_process(delta):
	move_and_collide(Vector2.LEFT * m_fWalkSpeed * delta)
