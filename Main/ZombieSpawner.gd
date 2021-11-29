extends Node2D

export var m_psZombie: PackedScene
export var m_vSpawnInterval: Vector2 = Vector2(5, 10)

onready var m_nSpawnTimer: Timer = $SpawnTimer
var m_avSpawnPos: Array

func _ready():
	m_nSpawnTimer.connect("timeout", self, "_spawn_zombie")
	m_nSpawnTimer.start(rand_range(m_vSpawnInterval.x, m_vSpawnInterval.y))
	
	for nPos in $SpawnPos.get_children():
		m_avSpawnPos.append(nPos.global_position)

func _spawn_zombie():
	var nZombie = m_psZombie.instance()
	add_child(nZombie)
	nZombie.global_position = _get_random_spawn_pos()
	m_nSpawnTimer.start(rand_range(m_vSpawnInterval.x, m_vSpawnInterval.y))

func _get_random_spawn_pos() -> Vector2:
	return m_avSpawnPos[rand_range(0, m_avSpawnPos.size())]
