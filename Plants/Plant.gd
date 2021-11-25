extends Node2D
class_name Plant

onready var m_nAnimPlayer: AnimationPlayer = $AnimationPlayer

func _ready():
	m_nAnimPlayer.play("Idle")
