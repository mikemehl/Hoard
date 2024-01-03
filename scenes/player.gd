extends Node2D
    
var bullet = preload("res://scenes/player_bullet.tscn")
var direction = Vector2(1, 0)
const speed = 5
const bStartOffset = 36
const bSpeed = 1500

signal player_moved(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.

func _input(event):
  if event.is_action_pressed("ui_accept"):
    var b = bullet.instantiate()
    get_tree().root.add_child(b)
    b.position = self.position + direction * bStartOffset
    b.get_node("body").apply_central_impulse(bSpeed * direction)
    print("shoot")
  elif event == InputEventKey:
    if event.pressed:
      if event.keycode == KEY_D:
        direction.y = -1
        direction.x = 0
      elif event.keycode == KEY_S:
        direction.y = 1
        direction.x = 0
      elif event.keycode == KEY_A:
        direction.x = -1
        direction.y = 0
      elif event.keycode == KEY_F:
        direction.x = 1
        direction.y = 0
  pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
  if Input.is_action_pressed("ui_up"):
    self.position.y -= speed
  if Input.is_action_pressed("ui_down"):
    self.position.y += speed
  if Input.is_action_pressed("ui_left"):
    self.position.x -= speed
  if Input.is_action_pressed("ui_right"):
    self.position.x += speed
  emit_signal("player_moved", self.position)
  pass

