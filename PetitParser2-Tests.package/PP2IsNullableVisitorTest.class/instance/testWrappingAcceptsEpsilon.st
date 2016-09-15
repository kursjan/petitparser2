tests
testWrappingAcceptsEpsilon
	| wrapped |
	wrapped := $a asParser2 >=> [ :context :cc |  ]
		isNullable: true;
		yourself.
	
	self assertIsNullable: wrapped
