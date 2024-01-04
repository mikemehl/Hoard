extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
    self.max_value = 100
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _on_player_health_changed(health):
    print("health changed")
    print(health)
    self.value = health
