setup & teardown
teardownSelector: teardownSelector
	| symbol |
	symbol := ('teardown', teardownSelector) asSymbol.
	
	(self respondsTo: symbol) ifTrue: [ 
		self perform: symbol.
	]