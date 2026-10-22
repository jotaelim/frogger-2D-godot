extends Node2D

var tempo := 120.0
var pontos1 := 0
var pontos2 := 0

@onready var jogador1 = $Jogador1
@onready var jogador2 = $Jogador2
@onready var tempo_label = $Interface/Tempo
@onready var placar_label = $Interface/Placar
@onready var fim_label = $Interface/Fim

func _on_carro_entrou(body):
    if body == jogador1:
        jogador1.voltar_inicio()
    elif body == jogador2:
        jogador2.voltar_inicio()

func _ready():
    for carro in $Carros.get_children():
        carro.body_entered.connect(_on_carro_entrou)

func verificar_chegada():
    if jogador1.position.y <= 80:
        pontos1 += 1
        jogador1.voltar_inicio()

    if jogador2.position.y <= 80:
        pontos2 += 1
        jogador2.voltar_inicio()

func fim_de_jogo():
    fim_label.text = "FIM DE JOGO"
    set_process(false)
    jogador1.set_physics_process(false)
    jogador2.set_physics_process(false)

    for carro in $Carros.get_children():
        carro.set_process(false)

func _process(delta):
    tempo -= delta
    verificar_chegada()

    tempo_label.text = "Tempo: " + str(max(0, int(tempo)))
    placar_label.text = "J1: " + str(pontos1) + "     J2: " + str(pontos2)

    if tempo <= 0:
        fim_de_jogo()
