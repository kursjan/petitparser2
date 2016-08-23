tests
testPluggableCompatibility
	| pp2Node |
	pp2Node := [ :ctx | (NumberParser on: (ctx stream)) nextNumber ] asParser asPetit2Parser.
	self assert: pp2Node parse: '123' to: 123.