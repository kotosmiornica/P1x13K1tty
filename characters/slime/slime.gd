extends Node2D


func play_walk():
	%Slime.play("walk")


func play_hurt():
	%Slime.play("hurt")
	%Slime.queue("walk")
