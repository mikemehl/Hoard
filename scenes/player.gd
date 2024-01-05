extends CharacterBody2D
    
var health = 100
var bullet = preload("res://scenes/player_bullet.tscn")
var bdirection = Vector2(1, 0)
const speed = 5
const bStartOffset = 36
const bSpeed = 1500

signal player_moved(pos)
signal player_health_changed(health)

# Called when the node enters the scene tree for the first time.
func _ready():
  emit_signal("player_health_changed", self.health)
  pass # Replace with function body.

func _input(event):
  if event.is_action_pressed("ui_accept"):
    var b = bullet.instantiate()
    get_tree().root.add_child(b)
    b.position = self.position + bdirection * bStartOffset
    b.set_rotation(bdirection.angle())
    b.apply_central_impulse(bSpeed * bdirection)
  elif event is InputEventKey and event.pressed:
    if event.keycode == KEY_D:
      bdirection.y = -1
      bdirection.x = 0
    elif event.keycode == KEY_S:
      bdirection.y = 1
      bdirection.x = 0
    elif event.keycode == KEY_A:
      bdirection.x = -1
      bdirection.y = 0
    elif event.keycode == KEY_F:
      bdirection.x = 1
      bdirection.y = 0
  pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
  var direction = Vector2(0, 0)
  if Input.is_action_pressed("ui_up"):
    direction.y -= speed
  if Input.is_action_pressed("ui_down"):
    direction.y += speed
  if Input.is_action_pressed("ui_left"):
    direction.x -= speed
  if Input.is_action_pressed("ui_right"):
    direction.x += speed
  move_and_collide(direction)
  emit_signal("player_moved", self.position)
  pass

func take_damage(damage):
      self.health -= damage
      emit_signal("player_health_changed", self.health)
