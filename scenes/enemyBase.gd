extends CharacterBody2D

var player = null
var direction = Vector2(0, 0)
var hit_cooldown = 0
var health = 10

# Called when the node enters the scene tree for the first time.
func _ready():
    find_player()
    pass # Replace with function body.

func _on_player_moved(player_pos):
  direction = (player_pos - position).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    find_player()
    if hit_cooldown == 0:
      move_towards_player(delta)
    else:
      move_and_slide()
      hit_cooldown -= 1
    print(health)
    pass

func find_player():
    if player == null:
      player = get_node("%Player")
      if player:
        print("Found player")
        player.connect("moved", _on_player_moved)


func take_damage(damage):
  health -= damage
  if health <= 0:
    queue_free()

func move_towards_player(delta):
  if player != null:
    velocity = direction * 100 * delta
    var collision = move_and_collide(velocity)
    if collision:
      var collider = collision.get_collider()
      if collider.is_in_group("Player"):
        print(collision.get_normal())
        velocity = 100 * collision.get_normal()
        print(velocity)
        if collider.has_method("take_damage"):
          collider.take_damage(10)
        hit_cooldown = 10
        move_and_slide()
