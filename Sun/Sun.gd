extends Area2D

export var m_vMoveSpeed: float = 50
export var m_vRotateSpeed: float = 15
export var m_fCollectTime: float = 1

onready var m_nSunlightCount: Node2D = get_tree().get_nodes_in_group("SunlightCount")[0]
onready var m_bIsCollected: bool = false

onready var m_nSprite: Sprite = $Sprite
onready var m_nTween: Tween = $Tween

func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "queue_free")
	m_nTween.connect("tween_all_completed", self, "_on_tween_completed")

func _process(delta):
	if !m_bIsCollected:
		position.y += m_vMoveSpeed * delta
		m_nSprite.rotation_degrees += m_vRotateSpeed * delta

func _input_event(viewport, event, shape_idx):
	if !m_bIsCollected:
		if event is InputEventMouseButton:
			if event.is_pressed():
				m_bIsCollected = true
				m_nTween.interpolate_property(self, "global_position",
						global_position, m_nSunlightCount.global_position,
						m_fCollectTime, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
				m_nTween.start()

func _on_tween_completed():
	m_nSunlightCount.increase_sun_count()
	queue_free()
