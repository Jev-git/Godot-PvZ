extends Node2D

export var m_iSunIncreaseValue: int = 25

onready var m_nLabel: Label = $Label

onready var m_iSunCount: int = 0

func increase_sun_count():
	m_iSunCount += m_iSunIncreaseValue
	m_nLabel.text = String(m_iSunCount)
