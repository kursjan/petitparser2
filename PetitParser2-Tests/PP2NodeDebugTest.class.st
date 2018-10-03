Class {
	#name : #PP2NodeDebugTest,
	#superclass : #TestCase,
	#traits : 'TPP2CollectionAssertions',
	#classTraits : 'TPP2CollectionAssertions classTrait',
	#instVars : [
		'parser'
	],
	#category : 'PetitParser2-Tests-Nodes'
}

{ #category : #tests }
PP2NodeDebugTest >> testEnableDebug [
	parser := PP2ExpressionGrammar new.
	parser enableDebug.
	
	self assert: parser allNodes allSatisfy: [ :node | node strategies size = 2 ].
	self assert: parser allNodes allSatisfy: [ :node |  node strategies first isDebugging ].
	self assert: parser allNodes noneSatisfy: [ :node |  node strategies second isDebugging ]	
]

{ #category : #tests }
PP2NodeDebugTest >> testEnableDebugAndRecordingTwice [
	parser := PP2ExpressionGrammar new.
	parser enableDebug.
	parser enableRecording.
	parser enableDebug.
	parser enableRecording.
	
	self assert: parser allNodes allSatisfy: [ :node | node strategies size = 2 ].
	self assert: parser allNodes allSatisfy: [ :node |  node strategies first isDebugging ].
	self assert: parser allNodes allSatisfy: [ :node |  node strategies first isRecording ].
	self assert: parser allNodes noneSatisfy: [ :node |  node strategies second isDebugging ]	.
]

{ #category : #tests }
PP2NodeDebugTest >> testEnableDebugAndRecordingTwiceOptimized [
	| strategies |
	parser := PP2ExpressionGrammar new.

	parser optimize.
	parser enableDebug.
	parser enableRecording.
	
	strategies := IdentityDictionary new.
	parser allNodesDo: [ :node | strategies at: node put: node strategies ].
	
	parser enableDebug.
	parser enableRecording.
	
	parser allNodesDo: [ :node | 
		self assert: (strategies at: node) equals: node strategies.
	]
]

{ #category : #tests }
PP2NodeDebugTest >> testEnableDebugTwice [
	parser := PP2ExpressionGrammar new.
	parser enableDebug.
	parser enableDebug.
	
	self assert: parser allNodes allSatisfy: [ :node | node strategies size = 2 ].
	self assert: parser allNodes allSatisfy: [ :node |  node strategies first isDebugging ].
	self assert: parser allNodes noneSatisfy: [ :node |  node strategies second isDebugging ]	
]

{ #category : #tests }
PP2NodeDebugTest >> testEnableRecordingCaches [
	parser := PP2ExpressionGrammar new.
	parser optimize.
	
	parser enableRecording.
	
	self deny: parser collectCaches isEmpty.
	self assert: parser collectCaches allSatisfy: [ :c | c isRecording ].
]

{ #category : #tests }
PP2NodeDebugTest >> testEnableRecordingDebugInvocations [
	parser := PP2ExpressionGrammar new.
	parser optimize.
	
	parser enableDebug.
	parser enableRecording.
	
	self assert: parser allNodes allSatisfy: [ :n | n strategy isRecording ].
]

{ #category : #tests }
PP2NodeDebugTest >> testEnableRecordingInvocations [
	parser := PP2ExpressionGrammar new.
	parser optimize.
	
	parser enableRecording.
	
	self flag: 'JK: Does not work right now, should implement?'
"	self assert: parser allNodes allSatisfy: [ :n | n strategy isRecording ]."
]

{ #category : #tests }
PP2NodeDebugTest >> testEnableRecordingRefreshCaches [
	parser := PP2ExpressionGrammar new.
	parser optimize.
	
	parser enableRecording.
	
	self deny: parser collectCaches isEmpty.
	self assert: parser allCaches equals: parser collectCaches.
]
