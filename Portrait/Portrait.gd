extends TextureButton

export var m_psPlant: PackedScene
export var m_iSunCost: int

onready var m_nBoard: TileMap = get_tree().get_nodes_in_group("Board")[0]

onready var m_nPreviewCursor: Sprite = $PreviewSpriteCursor
onready var m_nPreviewPlant: Sprite = $PreviewSpriteOnBoard

func _ready():
	pressed = false
	m_nPreviewCursor.visible = false
	m_nPreviewPlant.visible = false
	connect("toggled", self, "_on_button_toggle")

func _on_button_toggle(_bIsPressed: bool):
	m_nPreviewCursor.visible = _bIsPressed
	if !_bIsPressed:
		m_nPreviewPlant.visible = false
		m_nBoard.plant(m_psPlant, m_iSunCost, m_nBoard.get_cell_pos(get_global_mouse_position()))

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and pressed:
			pressed = false

func _process(delta):
	if pressed:
		var vMousePos: Vector2 = get_global_mouse_position()
		var vCellPos: Vector2 = m_nBoard.get_cell_pos(vMousePos)
		
		m_nPreviewCursor.global_position = vMousePos
		if m_nBoard.is_cell_empty(vCellPos):
			m_nPreviewPlant.visible = true
			m_nPreviewPlant.global_position = m_nBoard.get_cell_global_position(vCellPos)
		else:
			m_nPreviewPlant.visible = false
