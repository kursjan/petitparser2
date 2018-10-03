Extension { #name : #PP2DebuggingStrategyTest }

{ #category : #'*PetitParser2-Experiments-Reparsing' }
PP2DebuggingStrategyTest >> testReparsable [
	| debugStrategy |
	debugStrategy := strategy debug.
	
	self assert: debugStrategy reparsable == debugStrategy.
	self assert: debugStrategy strategy isKindOf: PP2Reparsable
	
]
