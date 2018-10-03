Class {
	#name : #PP2RewritePatternStrategyTest,
	#superclass : #TestCase,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#instVars : [
		'node',
		'strategy',
		'createParseNode',
		'createParseNodeStrategy'
	],
	#category : 'PetitParser2-RewriteEngine-Tests-Strategies'
}

{ #category : #initialization }
PP2RewritePatternStrategyTest >> setUp [
	node := $a asPParser.
	createParseNode := $b asPParser parseNode.

	strategy := node strategy.
	createParseNodeStrategy := createParseNode strategy.
]

{ #category : #initialization }
PP2RewritePatternStrategyTest >> testEnablePatternMatching [
	| patternMatchingStrategy |

	patternMatchingStrategy := strategy patternMatching.
	
	self assert: patternMatchingStrategy == strategy.
	self assert: patternMatchingStrategy isKindOf: strategy class.
]

{ #category : #initialization }
PP2RewritePatternStrategyTest >> testEnablePatternMatching_parseNode [
	| patternMatchingStrategy |

	patternMatchingStrategy := createParseNodeStrategy patternMatching.
	
	self assert: patternMatchingStrategy patternMatching == patternMatchingStrategy.
	self assert: patternMatchingStrategy isKindOf: PP2PatternStrategy.
	self assert: patternMatchingStrategy strategy == createParseNodeStrategy.
]
