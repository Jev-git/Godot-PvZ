extends Node2D

export var m_psSunlight: PackedScene
export var m_vSpawnInterval: Vector2 = Vector2(5, 10)
export var m_fHorizontalSpawnRange: Vector2 = Vector2(0, 64 * 9)

onready var m_nSpawnTimer: Timer = $SpawnTimer

func _ready():
	m_nSpawnTimer.connect("timeout", self, "_spawn_sun")
	m_nSpawnTimer.start(rand_range(m_vSpawnInterval.x, m_vSpawnInterval.y))

func _spawn_sun():
	var nSun = m_psSunlight.instance()
	add_child(nSun)
	nSun.position.x = rand_range(m_fHorizontalSpawnRange.x, m_fHorizontalSpawnRange.y)
	m_nSpawnTimer.start(rand_range(m_vSpawnInterval.x, m_vSpawnInterval.y))
