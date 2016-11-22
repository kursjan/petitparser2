*PetitParser2-GUI
testGtCacheReport
	| wrapper parser context |
	parser := PP2ExpressionParser new optimize enableDebug.
	context := self contextOn: '1+2'.
	
	parser parseWithContext: context.
	
	wrapper := GLMWrapper new.
	self shouldnt: [ wrapper show: [ :a | context gtCacheReport: a ] ] raise: Exception.