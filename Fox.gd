extends Node2D


signal Talking

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		emit_signal("Talking", text_2)



#First time talking to Sebastian 
var text_1 = "What do you want little girl?"
var text_2 = "Money? For what? A candy bar? The answer is no, I don't give to charity or hand outs to poor little girls"
var text_3 = "Your mothers sick? Why in heavens should I care?"
var text_4 = "shoo shoo"

#Sebastian after the first time
var text_5 = "You again? Leave me alone little pest"
var text_6 = "You're wasting my time, the answer is still no"

#Sebastian after a second time
var text_7 = "I said scram" #Growls at Angela with teeth showing
