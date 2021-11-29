extends KinematicBody2D

export var m_fMoveSpeed: float = 20

func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "queue_free")

func _physics_process(delta):
	var oCollision: KinematicCollision2D = move_and_collide(Vector2.RIGHT * m_fMoveSpeed * delta)
	if oCollision:
		if oCollision.collider is KinematicBody2D:
			oCollision.collider.take_damage(1)
			queue_free()
