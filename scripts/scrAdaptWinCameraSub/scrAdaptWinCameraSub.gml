

function AdaptWinCam_base(_w, _h, _anchorX, _anchorY, _x, _y, _angle) constructor {
	
	#region __private
	
	self.__base_w = max(1, round(_w));
	self.__base_h = max(1, round(_h));
	
	self.__scale = 1;
	
	self.__camera = new AdaptWinCam2dAnchor(self.__base_w, self.__base_h, _anchorX, _anchorY, undefined, undefined, _x, _y, _angle);
	
	#endregion
	
	static updata = function() {
		
		with (self.__camera) {
			
			var _s0 = self.updAngle();
			var _s1 = self.updSize();
			var _s2 = self.updPos();
			
			return (
				_s1 << 1 |
				_s2 << 2 |
				_s0
			);
		}
	}
	
	static resize = function(_w, _h) {
		
		self.__base_w = max(1, round(_w));
		self.__base_h = max(1, round(_h));
		
		self.__scale = 1;
		
		self.__camera.w = self.__base_w;
		self.__camera.h = self.__base_h;
	}
	
	#region get
	
	static getCam = function() {
		
		return self.__camera.camera;
	}
	
	static getX = function() {
		
		return self.__camera.x;
	}
	
	static getY = function() {
		
		return self.__camera.y;
	}
	
	static getW = function() {
		
		return self.__camera.w;
	}
	
	static getH = function() {
		
		return self.__camera.h;
	}
	
	static getAngle = function() {
		
		return self.__camera.angle; 
	}
	
	static getAnchorX = function() {
		
		return self.__camera.anchor_x;
	}
	
	static getAnchorY = function() {
		
		return self.__camera.anchor_y;
	}
	
	static getOffsetX = function() {
		
		return self.__camera.offset_x;
	}
	
	static getOffsetY = function() {
		
		return self.__camera.offset_y;
	}
	
	static getBaseW = function() {
		
		return self.__base_w;
	}
	
	static getBaseH = function() {
		
		return self.__base_h;
	}
	
	static getScale = function() {
	
		return self.__scale;
	}
	
	static getHalfW = function() {
		
		return self.__camera.math_half_w;
	}
	
	static getHalfH = function() {
		
		return self.__camera.math_half_h;
	}
	
	static getCentX = function() {
		
		return self.__camera.math_cent_x;
	}
	
	static getCentY = function() {
		
		return self.__camera.math_cent_y;
	}
	
	static getRealX = function() {
		
		return self.__camera.math_real_x;
	}
	
	static getRealY = function() {
		
		return self.__camera.math_real_y;
	}
	
	static getRectX = function() {
		
		return self.__camera.math_rect_x;
	}
	
	static getRectY = function() {
		
		return self.__camera.math_rect_y;
	}
	
	#endregion
	
	#region set
	
	static setX = function(_z) {
		
		self.__camera.x = _z;
	}
	
	static setY = function(_z) {
		
		self.__camera.y = _z;
	}
	
	static setPos = function(_x, _y) {
		
		with (self.__camera) {
			
			self.x = _x;
			self.y = _y;
		}
	}
	
	static setAngle = function(_z) {
		
		self.__camera.angle = _z;
	}
	
	static setAnchorX = function(_z) {
		
		self.__camera.anchor_x = _z;
	}
	
	static setAnchorY = function(_z) {
		
		self.__camera.anchor_y = _z;
	}
	
	static setAnchor = function(_x, _y) {
		
		with (self.__camera) {
			
			self.anchor_x = _x;
			self.anchor_y = _y;
		}
	}
	
	static setAnchorOfBaseX = function(_z) {
		
		self.__camera.anchor_x = _z / self.__base_w;
	}
	
	static setAnchorOfBaseY = function(_z) {
		
		self.__camera.anchor_y = _z / self.__base_h;
	}
	
	static setAnchorOfBase = function(_w, _h) {
		
		self.__camera.anchor_x = _w / self.__base_w;
		self.__camera.anchor_y = _h / self.__base_h;
	}
	
	static setOffsetY = function(_z) {
		
		self.__camera.offset_y = _z;
	}
	
	static setOffsetY = function(_z) {
		
		self.__camera.offset_y = _z;
	}
	
	static setOffset = function(_x, _y) {
		
		with (self.__camera) {
			
			self.offset_x = _x;
			self.offset_y = _y;
		}
	}
	
	static setScale = function(_z) {
		
		self.__scale    = _z;
		self.__camera.w = max(1, round(self.__base_w * _z));
		self.__camera.h = max(1, round(self.__base_h * _z));
	}
	
	static setScaleOfBaseW = function(_z) {
		
		self.setScale(_z / self.__base_w);
	}
	
	static setScaleOfBaseH = function(_z) {
		
		self.setScale(_z / self.__base_h);
	}
	
	#endregion
	
	#region add
	
	static addX = function(_z) {
		
		self.__camera.x += _z;
	}
	
	static addY = function(_z) {
		
		self.__camera.y += _z;
	}
	
	static addPos = function(_x, _y) {
		
		with (self.__camera) {
			
			self.x += _x;
			self.y += _y;
		}
	}
	
	static addAngle = function(_z) {
		
		self.__camera.angle += _z;
	}
	
	static addAnchorX = function(_z) {
		
		self.__camera.anchor_x += _z;
	}
	
	static addAnchorY = function(_z) {
		
		self.__camera.anchor_y += _z;
	}
	
	static addAnchor = function(_x, _y) {
		
		with (self.__camera) {
			
			self.anchor_x += _x;
			self.anchor_y += _y;
		}
	}
	
	static addOffsetY = function(_z) {
		
		self.__camera.offset_y += _z;
	}
	
	static addOffsetY = function(_z) {
		
		self.__camera.offset_y += _z;
	}
	
	static addOffset = function(_x, _y) {
		
		with (self.__camera) {
			
			self.offset_x += _x;
			self.offset_y += _y;
		}
	}
	
	static addScale = function(_z) {
		
		self.setScale(self.__scale + _z);
	}
	
	#endregion
	
	static draw = function(_color=c_red, _alpha=1, _fill=false) {
		
		var _save_alpha = draw_get_alpha();
		var _save_color = draw_get_color();
		
		draw_set_alpha(_alpha / 2);
		draw_set_color(_color);
		
		var _camera_w = self.__camera.w;
		var _camera_h = self.__camera.h;
		var _w = self.__camera.anchor_x * _camera_w;
		var _h = self.__camera.anchor_y * _camera_h;
		var _camera_x = self.__camera.x - _w;
		var _camera_y = self.__camera.y - _h;
		var _camera_angle = -self.__camera.angle;
		
		draw_rectangle(_camera_x + 1, _camera_y + 1, _camera_x + _camera_w - 2, _camera_y + _camera_h - 2, !_fill);
		
		draw_set_alpha(_alpha);
		
		draw_primitive_begin(_fill ? pr_trianglestrip : pr_linestrip);
		
		_camera_x = self.__camera.math_rect_x + 1;
		_camera_y = self.__camera.math_rect_y + 1;
		
		_camera_w -= 2;
		_camera_h -= 2;
		
		draw_vertex(_camera_x, _camera_y);
		
		var _w_x = lengthdir_x(_camera_w, _camera_angle);
		var _w_y = lengthdir_y(_camera_w, _camera_angle);
		
		_camera_angle -= 90;
		
		var _h_x = lengthdir_x(_camera_h, _camera_angle);
		var _h_y = lengthdir_y(_camera_h, _camera_angle);
		
		if (_fill) {
		
			draw_vertex(_camera_x + _w_x, _camera_y + _w_y);
			draw_vertex(_camera_x + _h_x, _camera_y + _h_y);
			draw_vertex(_camera_x + _w_x + _h_x, _camera_y + _w_y + _h_y);
		}
		else {
			
			draw_vertex(_camera_x + _w_x, _camera_y + _w_y);
			draw_vertex(_camera_x + _w_x + _h_x, _camera_y + _w_y + _h_y);
			draw_vertex(_camera_x + _h_x, _camera_y + _h_y);
			draw_vertex(_camera_x, _camera_y);
		}
		
		draw_primitive_end();
		
		draw_set_alpha(_save_alpha);
		draw_set_color(_save_color);
	}
	
}
