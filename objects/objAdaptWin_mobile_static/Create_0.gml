

#region public

globalvar GCamera, GCameraInst;

GCamera     = undefined;
GCameraInst = self;

#endregion

#region __private

var _size;

if (ADAPT_WIN_MOBILE_MODE == "w") {
	
	_size = adaptWinW(
		display_get_width(), display_get_height(), ADAPT_WIN_MOBILE_W
	);
}
else {
	
	_size = adaptWinH(
		display_get_width(), display_get_height(), ADAPT_WIN_MOBILE_H
	);
}

if (os_type == os_windows || os_type == os_linux || os_type == os_macosx) {
	
	var _winSize = adaptWinMin(
		_size[0], _size[1],
		ADAPT_WIN_MOBILE_MIN_W, ADAPT_WIN_MOBILE_MIN_H,
	);
	
	adaptWinWindowSetCenter(_winSize[0], _winSize[1]);
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

