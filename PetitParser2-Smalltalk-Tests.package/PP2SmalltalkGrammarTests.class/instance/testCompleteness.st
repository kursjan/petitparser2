testing
testCompleteness
	"This test asserts that all subclasses override all test methods."
	
	| subclasses |
	subclasses := self class allSubclasses.
	
	subclasses := (subclasses reject: [:subclass | subclass name endsWith: '_Optimized' ]).
	subclasses := (subclasses reject: [:subclass | subclass name endsWith: '_Direct' ]).
	subclasses := (subclasses reject: [:subclass | subclass name endsWith: '_InMemoryCtx' ]).
	subclasses do: [ :subclass |
		self class testSelectors do: [ :selector |
			self 
				assert: (selector = #testCompleteness or: [ subclass selectors includes: selector ])
				description: subclass printString , ' does not test ' , selector printString ] ]