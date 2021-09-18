

#region public

globalvar GCamera, GCameraInst;

GCamera     = undefined;
GCameraInst = self;

#endregion

#region __private

var _debug = (os_type == os_windows || os_type == os_linux || os_type == os_macosx);
var _size;
var _w, _h;

if (_debug && ADAPT_WIN_MOBILE_ASCPECT) {
	
	_w = ADAPT_WIN_MOBILE_ASCPECT_W;
	_h = ADAPT_WIN_MOBILE_ASCPECT_H;
}
else {
	
	_w = display_get_width();
	_h = display_get_width();
}

if (ADAPT_WIN_MOBILE_MODE == "w") {
	
	_size = adaptWinW(
		ADAPT_WIN_MOBILE_W, ADAPT_WIN_MOBILE_H,
		_w, _h, 
	);
}
else {
	
	_size = adaptWinH(
		ADAPT_WIN_MOBILE_W, ADAPT_WIN_MOBILE_H,
		_w, _h, 
	);
}

show_debug_message("  WinAdapt view: " + string(_size[0]) + "x" + string(_size[1]));

if (_debug) {
	
	var _winSize = adaptWinMin(
		_size[0], _size[1],
		ADAPT_WIN_MOBILE_MIN_W, ADAPT_WIN_MOBILE_MIN_H,
	);
	
	adaptWinWindowSetCenter(_winSize[0], _winSize[1]);
	
	show_debug_message("  WinAdapt window: " + string(_winSize[0]) + "x" + string(_winSize[1]));
}
else {
	
	show_debug_message("  WinAdapt window: " + string(_size[0]) + "x" + string(_size[1]));
}

function __AdaptWinCam_base(_w, _h) 
	: AdaptWinCam_base(_w, _h) constructor {
	
	static resize = undefined;
}

GCamera       = new __AdaptWinCam_base(_size[0], _size[1]);
self.__camera = GCamera.getCam();

if (ADAPT_WIN_MOBILE_GUI) {
	
	display_set_gui_size(_size[0], _size[1]);
}

if (ADAPT_WIN_MOBILE_APPSURF) {
	surface_resize(application_surface, _size[0], _size[1]);
}
else {
	application_surface_enable(false);
}

self.camera_upd = function() {
	
	if (self.auto_upd) {
		
		return GCamera.updata();
	}
	return 0;
}

#endregion

