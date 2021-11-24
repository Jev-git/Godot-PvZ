extends Node2D

onready var m_nAnimPlayer: AnimationPlayer = $AnimationPlayer

func _ready():
	m_nAnimPlayer.play("Idle")
