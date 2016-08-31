tests
testWrappingAcceptsEpsilon
	| wrapped |
	wrapped := $a asParser2 >=> [ :context :cc |  ]
		acceptsEpsilon: true;
		yourself.
	
	self assertAcceptsEpsilon: wrapped
