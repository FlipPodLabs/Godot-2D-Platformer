extends Control

@export var score_label: Label
@export var health_bar: TextureProgressBar

func update_score(score: int):
    score_label.text = str(score)

func update_health(health: int):
    health_bar.value = health
