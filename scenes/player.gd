extends Node2D
    
var bullet = preload("res://scenes/player_bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.

func _input(event):
  if event.is_action_pressed("ui_accept"):
    var b = bullet.instantiate()
    get_tree().root.add_child(b)
    b.position.x = self.position.x + 12
    b.position.y = self.position.y
    b.get_node("body").apply_central_impulse(Vector2(1500, 0))
    print("shoot")
  pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
  if Input.is_action_pressed("ui_up"):
    self.position.y -= 5
  if Input.is_action_pressed("ui_down"):
    self.position.y += 5
  if Input.is_action_pressed("ui_left"):
    self.position.x -= 5
  if Input.is_action_pressed("ui_right"):
    self.position.x += 5
  pass
