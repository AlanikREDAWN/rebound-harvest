extends AnimatedSprite2D
class_name Book

@export var page_count: int = 6

var current_page: int = 0

func _ready() -> void:
	current_page = 0
	go_to_page(current_page)
	
func clamp_current_page(new_page: int) -> int:
	if new_page < 0:
		new_page = page_count
	elif new_page > page_count:
		new_page = 0
	
	return new_page
	
func go_to_page(page: int):
	if current_page == page:
		return
	
	if page < 0 or page > page_count:
		return
		
	if page == 0:
		if current_page == 1:
			play("close_from_first")
		elif current_page == page_count:
			play("closed-front")
		else:
			play("close_from_middle")
	elif page == page_count:
		if current_page == page_count - 1:
			play("close_from_last")
		elif current_page == 0:
			play("closed_back")
	elif page == 1:
		if current_page == 0:
			play("open_to_first")
		elif current_page == 2:
			play("previous_to_first")
	elif page == page_count - 1:
		if current_page == page_count:
			play("open_to_last")
		if current_page == page_count - 2:
			play("next_to_last")
	elif page == 2 and current_page == 1:
		play("next_from_first")
	elif page == page_count - 2 && current_page == page_count - 1:
		play("previous_from_last")
	else:
		if page > current_page:
			play("next_page")
		elif page < current_page:
			play("previous_page")
	
	current_page = page

func _on_prev_button_pressed() -> void:
	go_to_page(clamp_current_page(current_page - 1))


func _on_next_button_pressed() -> void:
	go_to_page(clamp_current_page(current_page + 1))
