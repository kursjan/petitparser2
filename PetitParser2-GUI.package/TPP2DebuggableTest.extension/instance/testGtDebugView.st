*PetitParser2-GUI
testGtDebugView
	| wrapper parser context |
	parser := PP2ExpressionParser new optimize.
	context := self contextOn: '1 + 2'.
	
	parser parseWithContext: context.
	
	wrapper := GLMWrapper new.
	self shouldnt: [ wrapper show: [ :a | context gtDebugView: a ] ] raise: Exception.