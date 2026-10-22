extends Area2D

@export var velocidade := 150.0
@export var direita := true

func _process(delta):
    if direita:
        position.x += velocidade * delta
        if position.x > 950:
            position.x = -50
    else:
        position.x -= velocidade * delta
        if position.x < -50:
            position.x = 950
