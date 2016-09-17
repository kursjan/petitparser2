tests
testWrappingAcceptsEpsilon
	| wrapped |
	wrapped := $a asPParser >=> [ :context :cc |  ]
		isNullable: true;
		yourself.
	
	self assertIsNullable: wrapped
