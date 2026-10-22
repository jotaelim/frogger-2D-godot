extends CharacterBody2D

@export var jogador := 1
var inicio := Vector2.ZERO

func _ready():
    inicio = position

func _physics_process(_delta):
    var direcao = Vector2.ZERO

    if jogador == 1:
        if Input.is_key_pressed(KEY_W): direcao.y -= 1
        if Input.is_key_pressed(KEY_S): direcao.y += 1
        if Input.is_key_pressed(KEY_A): direcao.x -= 1
        if Input.is_key_pressed(KEY_D): direcao.x += 1
    else:
        if Input.is_key_pressed(KEY_UP): direcao.y -= 1
        if Input.is_key_pressed(KEY_DOWN): direcao.y += 1
        if Input.is_key_pressed(KEY_LEFT): direcao.x -= 1
        if Input.is_key_pressed(KEY_RIGHT): direcao.x += 1

    velocity = direcao.normalized() * 220
    move_and_slide()

    position.x = clamp(position.x, 20.0, 880.0)
    position.y = clamp(position.y, 55.0, 565.0)

func voltar_inicio():
    position = inicio
