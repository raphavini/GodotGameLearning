extends Node2D
@onready var bkg1:Sprite2D = $Sprite2D
@onready var _MainWindow: Window = get_window()
var window_width = 0
var window_height = 0
var window_y = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(bkg1.position)
	print(bkg1.	get_rect().size.x)
	window_width=_MainWindow.size[0]
	window_height=_MainWindow.size[1]/4
	window_y=_MainWindow.size[1]-window_height-55
	print("Position:", _MainWindow.position)
	print("Size", _MainWindow.size)
	_MainWindow.mode=Window.MODE_WINDOWED
	_MainWindow.set_position(Vector2i(0,window_y))
	_MainWindow.set_size(Vector2i(window_width,window_height))
	print("New Position", _MainWindow.position)
	print("New Size", _MainWindow.size)
	# ------------ MAIN WINDOW SETUP ------------
	# Enable per-pixel transparency, required for transparent windows but has a performance cost
	# Can also break on some systems
	ProjectSettings.set_setting("display/window/per_pixel_transparency/allowed", true)

	# Set the window settings - most of them can be set in the project settings
	_MainWindow.borderless = true
	_MainWindow.unresizable = true		# Prevent resizing the window
	_MainWindow.always_on_top = true	# Force the window always be on top of the screen
	_MainWindow.gui_embed_subwindows = false # Make subwindows actual system windows <- VERY IMPORTANT
	## display->window->transparent has to be set to true in the project setting, in IDE´s Menu "Project->Project Settings...",
	## Otherwise _MainWindow.transparent doesn't affect the player´s sprite (tested in Godot 4.2.2)
	_MainWindow.transparent = true		# Allow the window to be transparent
	## Settings that cannot be set in project settings
	_MainWindow.transparent_bg = true	# Make the window's background transparent
#

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
