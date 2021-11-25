extends Plant

export var m_psPea: PackedScene
export var m_fFireInterval: int = 3

onready var m_nTimer: Timer = $Timer

func _ready():
	m_nTimer.connect("timeout", self, "_fire_pea")
	m_nTimer.start(m_fFireInterval)

func _fire_pea():
	var nPea = m_psPea.instance()
	add_child(nPea)
