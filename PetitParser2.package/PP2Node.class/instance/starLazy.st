operators
starLazy
	| sea |
	sea := (#epsilon asPParser sea)
		waterToken: self;
		yourself.
	^ (sea map: [:_before :_epsilon :_after | 
			"return just before water, because island is nil and after water is empty"
			_before
		]) 