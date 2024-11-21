Class {
	#name : 'PP2DebuggingStrategyTest',
	#superclass : 'TestCase',
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#instVars : [
		'strategy',
		'node'
	],
	#category : 'PetitParser2-Tests-Debug',
	#package : 'PetitParser2-Tests',
	#tag : 'Debug'
}

{ #category : 'initialization' }
PP2DebuggingStrategyTest >> setUp [
	node := $a asPParser.
	strategy := node strategy.

]

{ #category : 'tests' }
PP2DebuggingStrategyTest >> testCache [
	| debugStrategy |
	debugStrategy := strategy debug.
	
	self assert: debugStrategy cache == debugStrategy.
	self assert: debugStrategy strategy isKindOf: PP2Cache
	
]

{ #category : 'tests' }
PP2DebuggingStrategyTest >> testDebug [
	| debugStrategy |

	debugStrategy := strategy debug.
	
	self assert: debugStrategy debug == debugStrategy.
	
]

{ #category : 'tests' }
PP2DebuggingStrategyTest >> testParsingGuard [
	| classification debugStrategy |
	debugStrategy := strategy debug.
	classification := Array new: 255 withAll: false.
	
	self assert: (debugStrategy parsingGuard: classification) == debugStrategy.
	self assert: debugStrategy strategy isKindOf: PP2ParsingGuard.	
	self assert: debugStrategy strategy retval isPetit2Failure.
]

{ #category : 'tests' }
PP2DebuggingStrategyTest >> testParsingGuardOptional [
	| classification debugStrategy optional |
	optional := $a asPParser optional.
	
	debugStrategy := optional strategy debug.
	classification := Array new: 255 withAll: false.
	
	self assert: (debugStrategy parsingGuard: classification) == debugStrategy.
	self assert: debugStrategy strategy isKindOf: PP2ParsingGuard.	
	self assert: debugStrategy strategy retval isNil.
]

{ #category : 'tests' }
PP2DebuggingStrategyTest >> testRecognizer [
	| debugStrategy |
	node := #letter asPParser.
	strategy := node strategy.
	debugStrategy := strategy debug.

	self assert: debugStrategy strategy isKindOf: PP2PredicateObject.
	
	self assert: debugStrategy recognizer == debugStrategy.
	self assert: debugStrategy strategy isKindOf: PP2PredicateObjectRecognizer.
	
]
