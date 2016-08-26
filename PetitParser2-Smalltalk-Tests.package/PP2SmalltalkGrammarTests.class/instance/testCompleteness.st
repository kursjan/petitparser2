testing
testCompleteness
	"This test asserts that all subclasses override all test methods."
	
	(self class allSubclasses reject: [:subclass | subclass name endsWith: '_Direct' ]) do: [ :subclass |
		self class testSelectors do: [ :selector |
			self 
				assert: (selector = #testCompleteness or: [ subclass selectors includes: selector ])
				description: subclass printString , ' does not test ' , selector printString ] ]