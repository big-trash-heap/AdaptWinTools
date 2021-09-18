

#region basic

function adaptWinW(_winW, _winH, _w) {
	
	return [_w, round(_winH / _winW * _w)];
}

function adaptWinH(_winW, _winH, _h) {
	
	return [round(_winW / _winH * _h), _h];
}

function adaptWinRatioMath(_winW, _winH, _lim) {

    var _lower  = [0, 1];
    var _upper  = [1, 0];
	var _aspect = _winW / _winH;
	
	var _mediant;
    while (true) {
		
        _mediant = [_lower[0] + _upper[0], _lower[1] + _upper[1]];
		
        if (_aspect * _mediant[1] > _mediant[0]) {
            
			if (_lim < _mediant[1]) return _upper;
            _lower = _mediant;
        } 
		else
		if (_aspect * _mediant[1] == _mediant[0]) {
            
			if (_lim >= _mediant[1])   return _mediant;
            if (_lower[1] < _upper[1]) return _lower;
            return _upper;
        } 
		else {
            
			if (_lim < _mediant[1]) return _lower;
            _upper = _mediant;
        }
    }
}

function adaptWinMin(_winW, _winH, _winMinW, _winMinH) {
	
	var _minscale = min(1, _winMinW / _winW, _winMinH / _winH);
	return [round(_winW * _minscale), round(_winH * _minscale)];
}

#endregion

#region for

function adaptWinForZ(_winZ, _z, _forZ) {
	
	return (_z / _winZ * _forZ);
}

#endregion

#region window

function adaptWinWindowSet(
	_w=window_get_width(), _h=window_get_height(), 
	_x=window_get_x(), _y=window_get_y(), 
	_anchorX=0, _anchorY=0) {
	
	window_set_size(_w, _h);
	window_set_position(
		_x - _w * _anchorX,
		_y - _h * _anchorY,
	);
}

function adaptWinWindowSetCenter(_w, _h) {
	
	adaptWinWindowSet(_w, _h, display_get_width() / 2, display_get_height() / 2, 0.5, 0.5);
}

#endregion

