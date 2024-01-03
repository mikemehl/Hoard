extends RigidBody2D

var player = null
var direction = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
    player = get_node("%Player")
    if player:
      print("Found player")
      player.connect("moved", _on_player_moved)
    pass # Replace with function body.

func _on_player_moved(player_pos):
  print(player_pos)
  direction = (player_pos - position).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if player == null:
      player = get_node("%Player")
      if player:
        print("Found player")
        player.connect("moved", _on_player_moved)
    pass

func _integrate_forces(body):
  body.set_constant_force(direction * 100)
  body.apply_torque(1)
  //var v = body.get_linear_velocity()
  v.x = clamp(v.x, -100, 100)
  v.y = clamp(v.y, -100, 100)
  body.set_linear_velocity(v)
  pass

func _body_entered(nodes):
  direction = -direction
