tests
testWrappingAcceptsEpsilon
	| wrapped |
	wrapped := $a asParser2 >=> [ :context :cc |  ]
		neverFails: true;
		yourself.
	
	self assertNeverFails: wrapped
