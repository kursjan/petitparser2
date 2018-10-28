Extension { #name : #PP2DebugResultIntegrationTest }

{ #category : #'*PetitParser2-GUI-Tests' }
PP2DebugResultIntegrationTest >> testGtCacheReport [
	| parser result wrapper |
	parser := PP2ExpressionParser new.
	result := parser debug: '1 + 2'.
	wrapper := GLMWrapper new.
	self shouldnt: [ wrapper show: [:a | result gtCacheReport: a ] ] raise: Exception.
]
