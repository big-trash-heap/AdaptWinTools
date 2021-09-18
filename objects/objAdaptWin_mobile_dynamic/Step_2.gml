

if (self.auto_upd) {
	
	self.upd_mask = GCamera.updata();
	if (self.upd_mask) event_user(0);
}

