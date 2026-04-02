extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var effect_player: AudioStreamPlayer = $EffectPlayer
@onready var ui_player: AudioStreamPlayer = $UIPlayer

var MusicLibrary = {
	"Level1" = preload("uid://or2v7jpp51wn"),
}

var EffectLibrary = {
	"StoneDoor" = preload("uid://byrmao4d0cumb"),
	"Hurt" = preload("uid://b1dr6va2ffvft"),
	"Heal" = preload("uid://clfsb5tvg5tkv")
}

var UILibrary = {
	"Blip" = preload("uid://cyt3vf24crmxh"),
	"Message" = preload("uid://byy34aa4r5h83"),
	"Click" = preload("uid://ds317vhsb8i8d"),
	"Pickup" = preload("uid://7cfbq2jnpomw")
}

func _ready() -> void:
	SignalBus.PlayMusic.connect(PlayMusicTrack)
	SignalBus.PlayEffect.connect(PlaySoundEffect)
	SignalBus.PlayUI.connect(PlayUIEffect)

func PlayMusicTrack(TargetSong: String):
	if MusicLibrary.has(TargetSong):
		var song = MusicLibrary.get(TargetSong)
		music_player.stream = song
		music_player.play()
	else:
		print("cannot play ", TargetSong,". Song not found in dictionary")

func PlaySoundEffect(TargetSound: String):
	if EffectLibrary.has(TargetSound):
		var sound = EffectLibrary.get(TargetSound)
		effect_player.stream = sound
		effect_player.play()
	else:
		print("cannot play ", TargetSound,". Sound not found in dictionary")

func PlayUIEffect(TargetSound: String):
	if UILibrary.has(TargetSound):
		var sound = UILibrary.get(TargetSound)
		ui_player.stream = sound
		ui_player.play()
	else:
		print("cannot play ", TargetSound,". Sound not found in dictionary")
