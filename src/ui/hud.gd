extends CanvasLayer

@onready var seeds_label: Label = $Margin/HBox/Seeds
@onready var hearts: HBoxContainer = $Margin/HBox/Hearts


func _ready() -> void:
	GameState.seeds_changed.connect(_on_seeds_changed)
	GameState.health_changed.connect(_on_health_changed)
	_on_seeds_changed(GameState.seeds)


func _on_seeds_changed(count: int) -> void:
	seeds_label.text = "%d" % count


func _on_health_changed(health: int) -> void:
	for i in hearts.get_child_count():
		hearts.get_child(i).visible = i < health
