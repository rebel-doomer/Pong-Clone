extends Node2D

var player_one_score: int = 0
var player_two_score: int = 0
@onready var score_label: Label = %Label

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_off_screen_body_entered(body: Node2D) -> void:
	if body.name == "Ball" and body.has_method("reset"):
		if not body.is_moving:
			return # Ignore extra triggers if already resetting

		if body.global_position.x < 0.0:
			player_two_score = player_two_score + 1
			print("Player 2 scored! Score -> P1: ", player_one_score, " | P2: ", player_two_score)
		else:
			player_one_score = player_one_score + 1
			print("Player 1 scored! Score -> P1: ", player_one_score, " | P2: ", player_two_score)

		score_label.text = str(player_one_score) + " - " + str(player_two_score)

		# note on deferred - postpone this until a safer moment.
		body.call_deferred("reset") # note: before running the func reset, call_deferred allows waiting until current physics calculations are finished, and then executes the "reset" function on the very next physics frame safely
