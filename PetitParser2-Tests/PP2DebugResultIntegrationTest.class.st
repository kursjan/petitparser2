Class {
	#name : #PP2DebugResultIntegrationTest,
	#superclass : #TestCase,
	#traits : 'TPP2CollectionAssertions + TPP2TypeAssertions',
	#classTraits : 'TPP2CollectionAssertions classTrait + TPP2TypeAssertions classTrait',
	#category : 'PetitParser2-Tests-Debug'
}

{ #category : #tests }
PP2DebugResultIntegrationTest >> testArithmetic [
	| parser result |
	parser := PP2ExpressionParser new.
	result := parser debug: '1 + 2'.
	self assert: result debugResult children size equals: 1.
	self assert: result debugResult children first result equals: #(1 $+ 2)
]

{ #category : #tests }
PP2DebugResultIntegrationTest >> testArithmeticCache [
	| parser result number links |
	parser := PP2ExpressionParser new.
	number := (parser productionAt: #number).
	number strategy: number strategy cache.
	
	result := parser debug: '1'.
	links := result debugResult allResults select: [ :e | 
		e children isEmpty not and: [ e children first isKindOf: PP2DebugResultLink ]
	] thenCollect: [ :e | e children first ].

	self assert: links size equals: 2.
	self assert: links allSatisfy: [ :l | l reference parser name = #number ].
]

{ #category : #tests }
PP2DebugResultIntegrationTest >> testArithmeticFailure [
	| parser result |
	parser := PP2ExpressionParser new.
	result := parser debug: '1 / 2'.
	self assert: result debugResult children size equals: 1.
	self assert: result debugResult children first result isPetit2Failure
]

{ #category : #tests }
PP2DebugResultIntegrationTest >> testGtCacheReport [
	| parser result wrapper |
	parser := PP2ExpressionParser new.
	result := parser debug: '1 + 2'.
	wrapper := GLMWrapper new.
	self shouldnt: [ wrapper show: [:a | result gtCacheReport: a ] ] raise: Exception.
]

{ #category : #tests }
PP2DebugResultIntegrationTest >> testNumberParser [
	| parser result |
	parser := PP2ExpressionParser new productionAt: #number.
	result := parser debug: '1'.
	self assert: result debugResult children size equals: 1.
	self assert: result debugResult children first result equals: 1
]

{ #category : #tests }
PP2DebugResultIntegrationTest >> testProfilingContext [
	| parser result |
	parser := PP2ExpressionParser new productionAt: #number.
	result := parser debug: '1'.
	self assert: result isKindOf: PP2RecordingContext.
]
