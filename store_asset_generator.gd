extends Control

## How to use:
# Set up each Control node under Screens to display whatever you want for that asset
# Run scene

## Steam image assets needed:
#920x430 Header Capsule
#462x174 Small Capsule
#1232x706 Main Capsule
#748x896 Vertical Capsule
#1438x810 Page Background (optional)
#600px  x 900px  Library Capsule
#920 x 430  Library Header 
#3840 x 1240 Library Hero (no text)
#Either 1280px wide and/or 720px tall Library Logo (text only) (needs transparent background)
#184x184 Community Icon

## Itch image assets: (not set up in examples) (more info: https://hedgiespresso.itch.io/itch-page-image-templates)
# 630x500(recommended) or 3840x2160(maximum) Cover Image (max file size 3mb)
# 960x400 Game Banner (height can be smaller, 200 to 400 recommended)


@onready var screens = $Screens.get_children()
const IMG_SAVE_PATH = "res://store_assets/steam/"
const IMG_SAVE_PATH_WITH_EXT = IMG_SAVE_PATH + "%s.png"

@onready var sub_viewport: SubViewport = $SubViewportContainer/SubViewport # uses sub viewport to render transparent backgrounds
@onready var how_to_use: Label = $HowToUse

func _ready():
	DirAccess.make_dir_recursive_absolute(IMG_SAVE_PATH) 
	ProjectSettings.set("display/window/stretch/mode", "disabled")
	$Screens.reparent(sub_viewport)
	
	how_to_use.hide()
	screenshot_all()
	OS.shell_open(ProjectSettings.globalize_path(IMG_SAVE_PATH))

func screenshot_all():
	for screen in screens:
		screen.hide()
	for screen in screens:
		screen.show()
		get_window().size = screen.size
		sub_viewport.size = screen.size
		await get_tree().process_frame
		await RenderingServer.frame_post_draw
		take_screenshot(screen.name)
		screen.hide()
	get_tree().quit()

func take_screenshot(file_name : String):
	var img = sub_viewport.get_viewport().get_texture().get_image()
	print("save with name ", file_name)
	print(IMG_SAVE_PATH_WITH_EXT % file_name)
	img.save_png(IMG_SAVE_PATH_WITH_EXT % file_name)
