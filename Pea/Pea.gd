extends KinematicBody2D

export var m_fMoveSpeed: float = 20

func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "queue_free")

func _physics_process(delta):
	var oCollision = move_and_collide(Vector2.RIGHT * m_fMoveSpeed * delta)
