extends TextureButton

export var m_psPlant: PackedScene

onready var m_nPreviewSprite: Sprite = $PreviewSprite

signal planted(_vGlobalPos)

func _ready():
	pressed = false
	m_nPreviewSprite.visible = false
	connect("toggled", self, "_on_button_toggle")

func _on_button_toggle(_bIsPressed: bool):
	m_nPreviewSprite.visible = _bIsPressed
	if !_bIsPressed:
		m_nPreviewSprite.global_position = get_global_position()
		emit_signal("planted", get_global_mouse_position())

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and pressed:
			pressed = false

func _process(delta):
	if pressed:
		m_nPreviewSprite.global_position = get_global_mouse_position()
