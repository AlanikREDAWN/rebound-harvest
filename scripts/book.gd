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
			play("closed-front")
		elif current_page == page_count:
			play("closed-front")
		else:
			play("closed-front")
	elif page == page_count:
		if current_page == page_count - 1:
			play("book-close")
		elif current_page == 0:
			play("closed-back")
	elif page == 1:
		if current_page == 0:
			play("book-open")
		elif current_page == 2:
			play("book-close")
	elif page == page_count - 1:
		if current_page == page_count:
			play("book-open")
		if current_page == page_count - 2:
			play("book-close")
	elif page == 2 and current_page == 1:
		play("book-next-page")
	elif page == page_count - 2 && current_page == page_count - 1:
		play("book-prev-page")
		print("prev page")
		
	else:
		if page > current_page:
			play("book-next-page")
		elif page < current_page:
			play("book-prev-page")
	
	current_page = page

func _on_prev_button_pressed() -> void:
	go_to_page(clamp_current_page(current_page - 1))


func _on_next_button_pressed() -> void:
	go_to_page(clamp_current_page(current_page + 1))
