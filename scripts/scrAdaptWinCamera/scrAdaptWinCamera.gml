

#region class

#macro ADAPT_WIN_CAM2D_MASK_ANGLE	1
#macro ADAPT_WIN_CAM2D_MASK_SIZE	2
#macro ADAPT_WIN_CAM2D_MASK_POS		4

function AdaptWinCam2d(_w, _h, _x=0, _y=0, _angle=0) constructor {
	
	self.camera = camera_create();
	
	self.w = _w;
	self.h = _h;
	self.x = _x;
	self.y = _y;
	
	self.angle = _angle;
	
	self.math_half_w = self.w / 2;
	self.math_half_h = self.h / 2;
	
	self.math_real_x = 0;
	self.math_real_y = 0;
	
	self.math_cent_x = 0;
	self.math_cent_y = 0;
	
	self.math_rect_x = 0;
	self.math_rect_y = 0;
	
	#region __private
	
	self.__prev_x = self.x;
	self.__prev_y = self.y;
	
	self.__prev_w = self.w;
	self.__prev_h = self.h;
	
	self.__prev_angle = self.angle;
	
	static __math = function() {
		
		self.math_cent_x = self.math_real_x + self.math_half_w;
		self.math_cent_y = self.math_real_y + self.math_half_h;
		
		var _dir = point_direction(0, 0, self.math_half_w, self.math_half_h) - self.angle;
		var _dis = point_distance(0, 0, self.math_half_w, self.math_half_h);
		
		self.math_rect_x = self.math_cent_x - lengthdir_x(_dis, _dir);
		self.math_rect_y = self.math_cent_y - lengthdir_y(_dis, _dir);
	}
	
	#endregion
	
	static updPos = function() {
		
		self.math_real_x = self.x;
		self.math_real_y = self.y;
		
		self.__math();
		
		camera_set_view_pos(self.camera, self.x, self.y);
		
		if (self.x != self.__prev_x or self.y != self.__prev_y) {
			
			self.__prev_x = self.x;
			self.__prev_y = self.y;
			
			return 1;
		}
		return 0;
	}
	
	static updSize = function() {
		
		self.math_half_w = self.w / 2;
		self.math_half_h = self.h / 2;
		
		camera_set_view_size(self.camera, self.w, self.h);
		
		if (self.w != self.__prev_w or self.h != self.__prev_h) {
			
			self.__prev_w = self.w;
			self.__prev_h = self.h;
			
			return 1;
		}
		return 0;
	}
	
	static updAngle = function() {
		
		var _updAngle = camera_get_view_angle(self.camera);
		
		camera_set_view_angle(self.camera, self.angle);
		
		if (self.angle != self.__prev_angle) {
			
			self.__prev_angle = self.angle;
			
			return 1;
		}
		return 0;
	}
	
	static updAll = function() {
		
		var _s0 = self.updAngle();
		var _s1 = self.updSize();
		var _s2 = self.updPos();
		
		return (
			_s1 << 1 |
			_s2 << 2 |
			_s0
		);
	}
	
	#region __init
	
	if (instanceof(self) == "AdaptWinCam2d") {
		
		self.updAll();
	}
	
	#endregion
	
}

function AdaptWinCam2dAnchor(_w, _h, _anchorX=0.5, _anchorY=0.5, _offsetX=0, _offsetY=0, _x=_w*_anchorX, _y=_h*_anchorY, _angle=0) 
	: AdaptWinCam2d(_w, _h, _x, _y, _angle) constructor {
	
	self.anchor_x = _anchorX;
	self.anchor_y = _anchorY;
	
	self.offset_x = _offsetX;
	self.offset_y = _offsetY;
	
	static updPos = function() {
		
		var _halfw = self.w / 2;
		var _halfh = self.h / 2;
		var _w = self.anchor_x * self.w;
		var _h = self.anchor_y * self.h;
		
		var _dis = point_distance(_w, _h, _halfw, _halfh);
		var _dir = point_direction(_w, _h, _halfw, _halfh) - self.angle;
		
		var _mathx = self.x + (lengthdir_x(_dis, _dir) - _halfw);
		var _mathy = self.y + (lengthdir_y(_dis, _dir) - _halfh);
		
		_dis = point_distance(0, 0, self.offset_x, self.offset_y);
		_dir = point_direction(0, 0, self.offset_x, self.offset_y) - self.angle;
		
		self.math_real_x = _mathx + lengthdir_x(_dis, _dir);
		self.math_real_y = _mathy + lengthdir_y(_dis, _dir);
		
		self.__math();
		
		camera_set_view_pos(self.camera, self.math_real_x, self.math_real_y);
		
		if (self.x != self.__prev_x or self.y != self.__prev_y) {
			
			self.__prev_x = self.x;
			self.__prev_y = self.y;
			
			return 1;
		}
		return 0;
	}
	
	#region __init
	
	if (instanceof(self) == "AdaptWinCam2dAnchor") {
		
		self.updAll();
	}
	
	#endregion
	
}

#endregion

#region functions

function adaptWinCamSet(_camera, _view=0, _destroy=true, _enable=true) {
	
	if (_enable) {
		
		view_enabled = true;
		view_visible[_view] = true;
	}
	
	if (_destroy) {
		
		camera_destroy(view_camera[_view]);
		view_camera[_view] = _camera;
		return -1;
	}
	else {
		
		var _oldcamera = view_camera[_view];
		view_camera[_view] = _camera;
		return _oldcamera;
	}
}

#endregion

