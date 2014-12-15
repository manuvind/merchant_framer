# This imports all the layers for "merchant_list_new" into merchant_list_newLayers21
merchant_list_newLayers = Framer.Importer.load "imported/merchant_list_new"

merchant_editLayers = Framer.Importer.load "imported/merchant_edit"

merchant_listLayers = Framer.Importer.load "imported/merchant_list"

merchant_homeLayers = Framer.Importer.load "imported/merchant_home"

home = merchant_homeLayers.merchant_home
top_part = merchant_homeLayers.top_home

home.states.add
	first: {x: -1200}

top_part.states.add
	first: {x: -1200}
	
home.on Events.Click, ->
	home.states.switch("first")
	top_part.states.switch("first")

beacons_list = merchant_listLayers.merchant_list

beacons_list.states.add
	first: {x: -1200}

beacons_list.on Events.Click, ->
	beacons_list.states.switch("first")

edit_basic = merchant_editLayers.edit_screen
edit_coupon = merchant_editLayers.edit_screen_coupon
edit_description = merchant_editLayers.edit_screen_description


edit_description.draggable.enabled = true
edit_description.draggable.speedX = 0

for layerEdit of merchant_editLayers
	merchant_editLayers[layerEdit].states.add
		first: {x: -1200}
# scrollUnder.visible = false

edit_basic.on Events.Click, ->
	Utils.delay 1, ->
		edit_basic.visible = false
	Utils.delay 3, ->
		edit_coupon.visible = false
		
edit_description.on Events.Click, ->
	Utils.delay 3, ->
		for layerEdit of merchant_editLayers
			merchant_editLayers[layerEdit].states.switch("first")
			
			
		

	