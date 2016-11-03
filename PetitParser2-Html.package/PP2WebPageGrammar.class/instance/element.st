element
element
	^ (elOpen, elContent, elClose)
		changesContext: false;
		memoize;
		yourself
