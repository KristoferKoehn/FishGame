extends Node

var day_song : AudioStreamPlayer3D
var low_song : AudioStreamPlayer3D
var night_song : AudioStreamPlayer3D

var check : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	day_song = AudioStreamPlayer3D.new()
	low_song = AudioStreamPlayer3D.new()
	night_song = AudioStreamPlayer3D.new()
	day_song.stream = load("res://Assets/Sound/Track1/DayTime.wav")
	low_song.stream = load("res://Assets/Sound/Track1/LowSunTime.wav")
	night_song.stream = load("res://Assets/Sound/Track1/NightTime.wav")
	add_child(day_song)
	add_child(low_song)
	add_child(night_song)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if !check:
		return
	
	if TimeManager.get_time() > 20 || TimeManager.get_time() < 4:
		day_song.volume_db = -80
		low_song.volume_db = -80
		night_song.volume_db = 0
	elif TimeManager.get_time() > 4 && TimeManager.get_time() < 6.5:
		day_song.volume_db = -80
		low_song.volume_db = 0
		night_song.volume_db = -80
	elif  TimeManager.get_time() > 17.5 && TimeManager.get_time() < 20:
		day_song.volume_db = -80
		low_song.volume_db = 0
		night_song.volume_db = -80
	elif TimeManager.get_time() > 6.5 && TimeManager.get_time() < 17.5:
		day_song.volume_db = 0
		low_song.volume_db = -80
		night_song.volume_db = -80

func start_music() -> void:
	check = true
	var t : Timer = Timer.new()
	t.connect("timeout", start_music)
	t.connect("timeout", t.queue_free)
	add_child(t)
	t.start(62)

	day_song.volume_db = -80
	low_song.volume_db = -80
	night_song.volume_db = -80
	day_song.play(0)
	low_song.play(0)
	night_song.play(0)
