internal
needRefresh
	^ DateAndTime now + (Duration seconds: 60) >= expiry