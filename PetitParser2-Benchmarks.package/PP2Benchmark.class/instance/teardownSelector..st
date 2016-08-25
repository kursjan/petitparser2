setup & teardown
teardownSelector: selector
	| symbol |
	symbol := ('teardown', selector) asSymbol.
	
	(self respondsTo: symbol) ifTrue: [ 
		self perform: symbol.
	]