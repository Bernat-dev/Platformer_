extends Area2D
signal moneda_agafada


func _on_body_entered(body: CharacterBody2D) -> void:
	body.moneda_agafada()
	queue_free()
