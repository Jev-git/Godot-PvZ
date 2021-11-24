extends Node2D

export var m_iSunIncreaseValue: int = 50

onready var m_nLabel: Label = $Label

onready var m_iSunCount: int = 0

func increase_sun_count():
	m_iSunCount += m_iSunIncreaseValue
	m_nLabel.text = String(m_iSunCount)

func use_sun(_iAmount: int):
	m_iSunCount -= _iAmount
	m_nLabel.text = String(m_iSunCount)
