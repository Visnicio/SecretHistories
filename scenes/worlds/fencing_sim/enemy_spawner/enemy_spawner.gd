extends Node3D
class_name FencingSimEnemySpawner

@onready var enemy_spawner_timer: Timer = $Timer

@export_subgroup("Scene Behavior")
@export var spawn_time: float

@export_subgroup("Scene Configuration")
@export var candle_circle: CandleCircle
## Wich node to add the enemy as child
@export var spawn_root: Node3D
@export var ENEMY_SCENE: PackedScene


func _ready() -> void:
	randomize()
	enemy_spawner_timer.timeout.connect(_on_spawn_timer_timeount)

## When the timer runs out, pick a random localtion and spawn at it
func _on_spawn_timer_timeount() -> void:
	spawn_enemy_on_random_candle()


func spawn_enemy(spawn_position: Vector3) -> void:
	if ENEMY_SCENE == null:
		push_error("No scene for the enemy instance was defined")
		return
	
	var enemy: Node3D = ENEMY_SCENE.instantiate()
	enemy.global_position = spawn_position
	spawn_root.add_child(enemy)


func spawn_enemy_on_random_candle() -> void:
	var candles_data: Dictionary = candle_circle.get_candles_data()
	
	var random_index: int = randi_range(0, candles_data.size() - 1)
	var distance_from_candle: float = .7
	
	# Adds an offset to spawn a little further from the candle, in the darkness
	var spawn_position: Vector3 = candles_data[random_index].global_position + (candles_data[random_index].global_position - Vector3(0,0,distance_from_candle))
	
	var target_position: Vector3 = spawn_position
	
	
	spawn_enemy(target_position)


func start_spawning() -> void:
	enemy_spawner_timer.start()


func stop_spawning() -> void:
	enemy_spawner_timer.stop()
