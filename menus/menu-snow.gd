extends CanvasLayer

var clip_box: Control
var background: TextureRect
var particles: CPUParticles2D


func _ready() -> void:
	layer = 1  
	background = get_node_or_null("../Background")
	clip_box = Control.new()
	clip_box.clip_contents = true
	clip_box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(clip_box)

	particles = CPUParticles2D.new()
	clip_box.add_child(particles)

	var gradient: Gradient = Gradient.new()
	gradient.set_color(0, Color(1, 1, 1, 1))
	gradient.set_color(1, Color(1.0, 1.0, 1.0, 0.0))
	gradient.add_point(0.5, Color(1.0, 1.0, 1.0, 1.0))

	var circle: GradientTexture2D = GradientTexture2D.new()
	circle.gradient = gradient
	circle.width = 16
	circle.height = 16
	circle.fill = GradientTexture2D.FILL_RADIAL
	circle.fill_from = Vector2(0.5, 0.5)
	circle.fill_to = Vector2(1.0, 0.5)
	particles.texture = circle


	particles.amount = 70
	particles.lifetime = 7.0
	particles.preprocess = 7.0  
	particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	particles.direction = Vector2(-1, 0.2) 
	particles.spread = 12.0
	particles.gravity = Vector2(0, 25)
	particles.initial_velocity_min = 200.0
	particles.initial_velocity_max = 450.0
	particles.scale_amount_min = 0.3
	particles.scale_amount_max = 0.9
	particles.color = Color(0.935, 0.915, 0.977, 0.9)  

	_update_area()
	get_viewport().size_changed.connect(_update_area)
	if background != null:
		background.resized.connect(_update_area)


func _update_area() -> void:
	if background == null or background.texture == null:
		return

	var tex_size: Vector2 = background.texture.get_size()
	var area: Vector2 = background.size
	var scale_factor: float = min(area.x / tex_size.x, area.y / tex_size.y)
	var drawn_size: Vector2 = tex_size * scale_factor
	var offset: Vector2 = (area - drawn_size) / 2.0

	clip_box.position = background.global_position + offset
	clip_box.size = drawn_size

	particles.position = Vector2(drawn_size.x + 20.0, drawn_size.y / 2.0)
	particles.emission_rect_extents = Vector2(1.0, drawn_size.y / 2.0)
