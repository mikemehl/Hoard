extends RigidBody2D

var damage = 5

# Called when the node enters the scene tree for the first time.
func _ready():
    contact_monitor = true
    max_contacts_reported = 2
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
  var colliders = get_colliding_bodies()
  if colliders.size() > 0:
    for b in colliders:
      if b.has_method("take_damage"):
        b.take_damage(damage)
    queue_free()
    pass

func give_damage():
    return damage
