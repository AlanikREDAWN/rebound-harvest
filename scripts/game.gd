extends Node2D

@onready var simple_detective: Sprite2D = $SimpleDetective
@onready var camera_2d: Camera2D = $Camera2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var player_instance = preload("res://scenes/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	simple_detective.visible = false # hide the detective dupe - used for cutscene 
	
	Global.brotherEntered.connect(_brotherEntered)
	
	# spawn player when the game scene is switched to
	var player = player_instance.instantiate()
	Player.instance = player
	get_tree().root.add_child.call_deferred(player)

	# go to the spawn cutscene right away - don't want the player trying to run away before seeing the story
	if Global.spawnText == false:
		Global.spawnText = true
		Global.cutscene = Global.Cutscenes.SPAWN

func _brotherEntered():
	Global.brotherText = true
	Global.cutscene = Global.Cutscenes.BROTHER

func hideUI():
	Player.instance.find_child("BulletUI").visible = false
	Player.instance.find_child("HealthTracker").visible = false

func showUI():
	Player.instance.find_child("BulletUI").visible = true
	Player.instance.find_child("HealthTracker").visible = true

func _process(delta: float) -> void:
	match Global.cutscene:
		Global.Cutscenes.SPAWN:
			if Global.spawnText == true:
				hideUI()
				
				# create list of SpawnText scenes (since they're just numbered 1-5)
				var spawnTexts = [] 
				for i in range(6):
					spawnTexts.append("SpawnText" + str(i))
				
				spawnTexts.remove_at(0) # remove SpawnText0 since it doesn't actually exist
				
				# loop through list and hide em all 
				for i in spawnTexts.size():
					var spawnText = spawnTexts[i]
					Player.instance.find_child(spawnText).visible = false
				
				get_tree().paused = true
				
				match Global.spawnTextInt:
					1:
						Player.instance.find_child("spawnText1").visible = true
						
						# To Delete
						#Player.instance.find_child("SpawnText1").visible = true
						#Player.instance.find_child("SpawnText2").visible = false
						#Player.instance.find_child("SpawnText3").visible = false
						#Player.instance.find_child("SpawnText4").visible = false
						#Player.instance.find_child("SpawnText5").visible = false
					2:
						Player.instance.find_child("SpawnText1").visible = false
						Player.instance.find_child("SpawnText2").visible = true
						
						# To Delete
						#Player.instance.find_child("SpawnText1").visible = false
						#Player.instance.find_child("SpawnText2").visible = true
						#Player.instance.find_child("SpawnText3").visible = false
						#Player.instance.find_child("SpawnText4").visible = false
						#Player.instance.find_child("SpawnText5").visible = false
					3:
						Player.instance.find_child("SpawnText2").visible = false
						Player.instance.find_child("SpawnText3").visible = true
						
						# To Delete
						#Player.instance.find_child("SpawnText1").visible = false
						#Player.instance.find_child("SpawnText2").visible = false
						#Player.instance.find_child("SpawnText3").visible = true
						#Player.instance.find_child("SpawnText4").visible = false
						#Player.instance.find_child("SpawnText5").visible = false
					4:
						Player.instance.find_child("SpawnText3").visible = false
						Player.instance.find_child("SpawnText4").visible = true
						
						# To Delete
						#Player.instance.find_child("SpawnText1").visible = false
						#Player.instance.find_child("SpawnText2").visible = false
						#Player.instance.find_child("SpawnText3").visible = false
						#Player.instance.find_child("SpawnText4").visible = true
						#Player.instance.find_child("SpawnText5").visible = false
					5:
						Player.instance.find_child("SpawnText4").visible = false
						Player.instance.find_child("SpawnText5").visible = true
						
						# To Delete
						#Player.instance.find_child("SpawnText1").visible = false
						#Player.instance.find_child("SpawnText2").visible = false
						#Player.instance.find_child("SpawnText3").visible = false
						#Player.instance.find_child("SpawnText4").visible = false
						#Player.instance.find_child("SpawnText5").visible = true
					var n when n > 5:
						Global.spawnText = false
			elif Global.spawnText == false:
				# create list of SpawnText scenes (since they're just numbered 1-5)
				var spawnTexts = [] 
				for i in range(6):
					spawnTexts.append("SpawnText" + str(i))
				
				spawnTexts.remove_at(0) # remove SpawnText0 since it doesn't actually exist
				
				# loop through list and hide em all 
				for i in spawnTexts.size():
					var spawnText = spawnTexts[i]
					Player.instance.find_child(spawnText).visible = false
				
				# To Delete
				#Player.instance.find_child("SpawnText1").visible = false
				#Player.instance.find_child("SpawnText2").visible = false
				#Player.instance.find_child("SpawnText3").visible = false
				#Player.instance.find_child("SpawnText4").visible = false
				#Player.instance.find_child("SpawnText5").visible = false
				if Global.spawnTextCompleted == false:
					showUI()
					get_tree().paused = false
					Global.spawnTextCompleted = true
		Global.Cutscenes.BROTHER:
			if Global.brotherText == true:
				hideUI()
				
				# create list of BrotherText scenes (since they're just numbered 1-21)
				var brotherTexts = []
				for i in range(22):
					brotherTexts.append("BrotherText" + str(i))
					
				brotherTexts.remove_at(0) # remove BrotherText0 since it doesn't actually exist
				
				# loop through list and hide em all
				for i in brotherTexts.size():
					var brotherText = brotherTexts[i]
					Player.instance.find_child(brotherText).visible = false
					
				get_tree().paused = true
				match Global.brotherTextInt:
					1:
						Player.instance.find_child("BrotherText1").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText1").visible = true
						
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					2:
						Player.instance.find_child("BrotherText1").visible = false
						Player.instance.find_child("BrotherText2").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText2").visible = true

							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					3:
						Player.instance.find_child("BrotherText2").visible = false
						Player.instance.find_child("BrotherText3").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText3").visible = true
							#Player.instance.find_child("BrotherText1").visible = false

							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					4:
						Player.instance.find_child("BrotherText3").visible = false
						Player.instance.find_child("BrotherText4").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText4").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false

							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					5:
						Player.instance.find_child("BrotherText4").visible = false
						Player.instance.find_child("BrotherText5").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText5").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false

							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					6:
						Player.instance.find_child("BrotherText5").visible = false
						Player.instance.find_child("BrotherText6").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText6").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false

							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					7:
						Player.instance.find_child("BrotherText6").visible = false
						Player.instance.find_child("BrotherText7").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText7").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false

							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					8:
						Player.instance.find_child("BrotherText7").visible = false
						Player.instance.find_child("BrotherText8").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText8").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false

							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					9:
						Player.instance.find_child("BrotherText8").visible = false
						Player.instance.find_child("BrotherText9").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText9").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false

							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					10:
						Player.instance.find_child("BrotherText9").visible = false
						Player.instance.find_child("BrotherText10").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText10").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false

							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					11:
						Player.instance.find_child("BrotherText10").visible = false
						Player.instance.find_child("BrotherText11").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText11").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false

							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					12:
						Player.instance.find_child("BrotherText11").visible = false
						Player.instance.find_child("BrotherText12").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText12").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false

							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					13:
						Player.instance.find_child("BrotherText12").visible = false
						Player.instance.find_child("BrotherText13").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText13").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false

							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					14:
						Player.instance.find_child("BrotherText13").visible = false
						Player.instance.find_child("BrotherText14").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText14").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false

							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					15:
						Player.instance.find_child("BrotherText14").visible = false
						Player.instance.find_child("BrotherText15").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText15").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false

							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					16:
						Player.instance.find_child("BrotherText15").visible = false
						Player.instance.find_child("BrotherText16").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText16").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false

							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					17:
						Player.instance.find_child("BrotherText16").visible = false
						Player.instance.find_child("BrotherText17").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText17").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false

							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					18:
						Player.instance.find_child("BrotherText17").visible = false
						Player.instance.find_child("BrotherText18").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText18").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false

							#Player.instance.find_child("BrotherText19").visible = false
							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					19:
						Player.instance.find_child("BrotherText18").visible = false
						Player.instance.find_child("BrotherText19").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText19").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false

							#Player.instance.find_child("BrotherText20").visible = false
							#Player.instance.find_child("BrotherText21").visible = false
					20:
						Player.instance.find_child("BrotherText19").visible = false
						Player.instance.find_child("BrotherText20").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText20").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false

							#Player.instance.find_child("BrotherText21").visible = false
					21:
						Player.instance.find_child("BrotherText20").visible = false
						Player.instance.find_child("BrotherText21").visible = true
						
						# To Delete
							#for i in brotherTexts.size():
								#var brotherText = brotherTexts[i]
								#Player.instance.find_child(brotherText).visible = false
							#
							#Player.instance.find_child("BrotherText21").visible = true
							#Player.instance.find_child("BrotherText1").visible = false
							#Player.instance.find_child("BrotherText2").visible = false
							#Player.instance.find_child("BrotherText3").visible = false
							#Player.instance.find_child("BrotherText4").visible = false
							#Player.instance.find_child("BrotherText5").visible = false
							#Player.instance.find_child("BrotherText6").visible = false
							#Player.instance.find_child("BrotherText7").visible = false
							#Player.instance.find_child("BrotherText8").visible = false
							#Player.instance.find_child("BrotherText9").visible = false
							#Player.instance.find_child("BrotherText10").visible = false
							#Player.instance.find_child("BrotherText11").visible = false
							#Player.instance.find_child("BrotherText12").visible = false
							#Player.instance.find_child("BrotherText13").visible = false
							#Player.instance.find_child("BrotherText14").visible = false
							#Player.instance.find_child("BrotherText15").visible = false
							#Player.instance.find_child("BrotherText16").visible = false
							#Player.instance.find_child("BrotherText17").visible = false
							#Player.instance.find_child("BrotherText18").visible = false
							#Player.instance.find_child("BrotherText19").visible = false

					var n when n > 21:
						Global.brotherText = false
						Global.disableBrother.emit()
			elif Global.brotherText == false:
				showUI()
					
				var brotherTexts = []
				for i in range(22):
					brotherTexts.append("BrotherText" + str(i))
				
				brotherTexts.remove_at(0)
					
				for i in brotherTexts.size():
					var brotherText = brotherTexts[i]
					Player.instance.find_child(brotherText).visible = false
				
				if Global.talkedToBrother == false:
					get_tree().paused = false
					Global.talkedToBrother = true
		Global.Cutscenes.ROCK:
			if Global.rockText == true:
				hideUI()
				get_tree().paused = true
				Player.instance.position = Vector2(5868.0, 1249.0)
				Player.instance.visible = false
				
				simple_detective.visible = true
				camera_2d.visible = true
				camera_2d.enabled = true
				camera_2d.make_current()
				animation_player.play("player fall")
				await animation_player.animation_finished
				
				simple_detective.visible = false
				camera_2d.visible = false
				camera_2d.enabled = false
				Player.instance.position = Vector2(5903.0, 1942.0)
				Player.instance.visible = true
				Player.instance.find_child("Camera2D").make_current()
				Global.rockText = false
				showUI()
				get_tree().paused = false
				
		Global.Cutscenes.SEWER:
			if Global.sewerText == true:
				hideUI()
				
				var sewerTexts = []
				for i in range(7):
					sewerTexts.append("SewerText" + str(i))
				
				sewerTexts.remove_at(0)
				
				for i in sewerTexts.size():
					var sewerText = sewerTexts[i]
					Player.instance.find_child(sewerText).visible = false
				get_tree().paused = true
				
				match Global.sewerTextInt:
					1:
						for i in sewerTexts.size():
							var sewerText = sewerTexts[i]
							Player.instance.find_child(sewerText).visible = false
							
						Player.instance.find_child("SewerText1").visible = true
					2:
						for i in sewerTexts.size():
							var sewerText = sewerTexts[i]
							Player.instance.find_child(sewerText).visible = false
							
						Player.instance.find_child("SewerText2").visible = true
					3:
						for i in sewerTexts.size():
							var sewerText = sewerTexts[i]
							Player.instance.find_child(sewerText).visible = false
							
						Player.instance.find_child("SewerText3").visible = true
					4:
						for i in sewerTexts.size():
							var sewerText = sewerTexts[i]
							Player.instance.find_child(sewerText).visible = false
							
						Player.instance.find_child("SewerText4").visible = true
					5:
						for i in sewerTexts.size():
							var sewerText = sewerTexts[i]
							Player.instance.find_child(sewerText).visible = false
							
						Player.instance.find_child("SewerText5").visible = true
						var sewer_text = Player.instance.find_child("SewerText5")
						
						if Global.sewerAnimPlay == false:
							sewer_text.get_node("AnimatedSprite2D").play("default")
							Global.sewerAnimPlay = true
						
						
					6:
						for i in sewerTexts.size():
							var sewerText = sewerTexts[i]
							Player.instance.find_child(sewerText).visible = false
							
						Player.instance.find_child("SewerText6").visible = true
					var n when n > 6:
						Global.sewerText = false
		
			elif Global.sewerText == false:
				showUI()
					
				#var sewerTexts = []
				#for i in range(22):
					#sewerTexts.append("SewerText" + str(i))
				#
				#sewerTexts.remove_at(0)
				#
				#Player.instance.find_child("sewerText1").visible = false
				#Player.instance.find_child("sewerText2").visible = false
				#Player.instance.find_child("sewerText3").visible = false
				#Player.instance.find_child("sewerText4").visible = false
				#Player.instance.find_child("sewerText5").visible = false
				#Player.instance.find_child("sewerText6").visible = false
				#for i in sewerTexts.size():
					#var sewerText = sewerTexts[i]
					#Player.instance.find_child(sewerText).visible = false
				
				if Global.sewerTextCompleted == false:
					get_tree().paused = false
					Global.sewerTextCompleted = true
	if Input.is_action_just_pressed("click"):
		if Global.spawnText == true && Global.spawnTextInt <= 5:
			Global.spawnTextInt += 1
		if Global.brotherText == true && Global.brotherTextInt <= 21:
			Global.brotherTextInt += 1
		if Global.sewerText == true && Global.sewerTextInt <= 6:
			Global.sewerTextInt += 1



		


func _on_rock_sewer_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.cutscene = Global.Cutscenes.ROCK
		Global.rockText = true
		var player_health = Player.instance.find_children("*", "Health")[0]
		player_health.set_health(3)


func _on_sewer_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if Global.sewerTextCompleted == false:
			Global.cutscene = Global.Cutscenes.SEWER
			Global.sewerText = true


func _on_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player.instance.queue_free()
		get_tree().change_scene_to_file("res://scenes/Grannify.tscn")
