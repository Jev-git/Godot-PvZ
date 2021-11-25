extends Plant

export var m_psSun: PackedScene
export var m_iSpawnInterval: int = 5

onready var m_nSpawnTimer: Timer = $SpawnTimer

func _ready():
	m_nSpawnTimer.connect("timeout", self, "_spawn_sun")
	m_nSpawnTimer.start(m_iSpawnInterval)

func _spawn_sun():
	var nSun = m_psSun.instance()
	add_child(nSun)
