extends Control



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	calculate()
	
	updateValues()
	
	pass

var minTeeth : float = 0
var ratio : float = 0
var distance : float = 0

var module : float = 0
var smallGearTeeth : float = 0
var bigGearTeeth : float = 0

var valid = false

func updateValues():
	
	minTeeth = %minTeeth.value
	ratio = %ratio.value
	distance = %distance.value
	
	%smallToothOutput.text = str(smallGearTeeth)
	%bigTeethOutput.text = str(bigGearTeeth)
	%moduleOutput.text = str(module) + " (1/" + str(1.0/module) + ")"
	
	
	valid = true
	
	if minTeeth <= 0 or distance <= 0 or ratio < 1:
		valid = false
	
	$ColorRect.color = Color("0070dd") if valid else Color("0070dd")
	
	pass
	
	

func calculate():
	
	smallGearTeeth = calculateSmallGearTeeth()
	bigGearTeeth = smallGearTeeth * ratio
	
	module = calculateSmallGearPitchDiameter()/smallGearTeeth
	
	
	pass
	

func calculateSmallGearTeeth():
	#will be updated later
	
	var numTeeth = minTeeth
	
	while (numTeeth < 10000) and numTeeth * ratio != int(numTeeth * ratio):
		numTeeth += 1
	
	return numTeeth
	
	


func calculateSmallGearPitchDiameter():
	#will be updated later
	
	#x + ratio * x = distance
	
	
	return distance / (1.0 + ratio) * 2.0

func _on_module_copy_pressed():
	DisplayServer.clipboard_set("(1/" + str(1.0/module) + ")")
	pass # Replace with function body.


func _on_small_teeth_copy_pressed():
	DisplayServer.clipboard_set(%smallToothOutput.text)
	pass # Replace with function body.




func _on_bigteeth_copy_pressed():
	DisplayServer.clipboard_set(%bigTeethOutput.text)
	pass # Replace with function body.
