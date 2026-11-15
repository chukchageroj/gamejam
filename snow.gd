extends CanvasLayer
# Постоянный снег. Добавь этот узел (CanvasLayer + этот скрипт) в каждый уровень.
# Частицы привязаны к экрану, поэтому снег идёт всегда, куда бы ни ехала камера.

var particles: CPUParticles2D


func _ready() -> void:
	layer = 10  # поверх игры
	particles = CPUParticles2D.new()
	add_child(particles)

	particles.amount = 20
	particles.lifetime = 8.0
	particles.preprocess = 8.0  
	particles.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	particles.direction = Vector2(0, 1)
	particles.spread = 15.0
	particles.gravity = Vector2(0, 0)
	particles.initial_velocity_min = 40.0
	particles.initial_velocity_max = 90.0
	particles.scale_amount_min = 1.5
	particles.scale_amount_max = 3.5
	particles.color = Color(1, 1, 1, 0.9)

	_update_area()
	get_viewport().size_changed.connect(_update_area)


func _update_area() -> void:
	# Окно у нас растягивается (aspect=expand), поэтому подстраиваем зону под размер экрана
	var size: Vector2 = get_viewport().get_visible_rect().size
	particles.position = Vector2(size.x / 2.0, -10.0)
	particles.emission_rect_extents = Vector2(size.x / 2.0 + 20.0, 1.0)
