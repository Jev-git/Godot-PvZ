extends Area2D

export var m_fMoveDistance: float = 50
export var m_fMoveTime: float = 1
export var m_fCollectTime: float = 1
onready var m_bIsMovingUp: bool = true

onready var m_nSunlightCount: Node2D = get_tree().get_nodes_in_group("SunlightCount")[0]
onready var m_bIsCollected: bool = false

onready var m_nSprite: Sprite = $Sprite
onready var m_nTween: Tween = $Tween

func _ready():
	m_nTween.connect("tween_completed", self, "_on_tween_completed")
	m_nTween.interpolate_property(self, "position",
			position, position - Vector2(0, m_fMoveDistance),
			m_fMoveTime, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	m_nTween.start()

func _input_event(viewport, event, shape_idx):
	if !m_bIsCollected:
		if event is InputEventMouseButton:
			if event.is_pressed():
				m_nTween.stop_all()
				m_bIsCollected = true
				m_nTween.interpolate_property(self, "global_position",
						global_position, m_nSunlightCount.global_position,
						m_fCollectTime, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
				m_nTween.start()

func _on_tween_completed(object: Object, key: NodePath):
	if m_bIsCollected:
		m_nSunlightCount.increase_sun_count()
		queue_free()
	else:
		if m_bIsMovingUp:
			m_bIsMovingUp = false
			m_nTween.interpolate_property(self, "position",
					position, position + Vector2(0, m_fMoveDistance),
					m_fMoveTime, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			m_nTween.start()
