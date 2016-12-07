operators
starLazy
	^ ((#epsilon asPParser sea)
		waterToken: self)
	map: [:_before :_epsilon :_after | 
		"return just before water, because island is nil and after water is empty"
		_before
	] 