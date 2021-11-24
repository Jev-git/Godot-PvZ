extends TileMap

export var m_vBoardSize: Vector2 = Vector2(9, 5)

onready var m_nPlants: Node2D = $Plants

onready var m_aabIsCellEmpty: Array

func _ready():
	for iCol in m_vBoardSize.x:
		m_aabIsCellEmpty.append([])
		for iRow in m_vBoardSize.y:
			m_aabIsCellEmpty[iCol].append(true)

func get_cell_pos(_vGlobalPos: Vector2) -> Vector2:
	return world_to_map(to_local(_vGlobalPos))

func is_cell_empty(_vCellPos: Vector2) -> bool:
	if _vCellPos.x < 0 or _vCellPos.x >= m_vBoardSize.x \
		or _vCellPos.y < 0 or _vCellPos.y >= m_vBoardSize.y:
		return false
	else:
		return m_aabIsCellEmpty[_vCellPos.x][_vCellPos.y]

func get_cell_global_position(_vCellPos: Vector2):
	return to_global(map_to_world(_vCellPos)) + cell_size / 2

func plant(_psPlant: PackedScene, _vCellPos: Vector2):
	if is_cell_empty(_vCellPos):
		var nPlant: Node2D = _psPlant.instance()
		m_nPlants.add_child(nPlant)
		nPlant.global_position = get_cell_global_position(_vCellPos)
		m_aabIsCellEmpty[_vCellPos.x][_vCellPos.y] = false
