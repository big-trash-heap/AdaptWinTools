
//
self.camera.addOffset(
	keyboard_check(vk_right) - keyboard_check(vk_left),
	keyboard_check(vk_down)  - keyboard_check(vk_up),
);

//
var _rotate = (keyboard_check(ord("D")) - keyboard_check(ord("A")));
if (_rotate != 0) {
	
	self.image_angle -= _rotate * 2;
}

//
var _move = (keyboard_check(ord("S")) - keyboard_check(ord("W")));
if (_move != 0) {
	
	self.x -= lengthdir_x(4, self.image_angle) * _move;
	self.y -= lengthdir_y(4, self.image_angle) * _move;
}

//
self.camera.setPos(self.x, self.y);
self.camera.setAngle(-self.image_angle + 90);
self.camera.updata();

