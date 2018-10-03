Class {
	#name : #PP2OptimizationParserTest,
	#superclass : #PP2AbstractParserTest,
	#instVars : [
		'context'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #accessing }
PP2OptimizationParserTest >> context [
	context isNil ifTrue: [
		context := PP2RecordingContext new
	].

	^ context
]

{ #category : #accessing }
PP2OptimizationParserTest >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser parseAdaptable: aStream withContext: aContext
]

{ #category : #tests }
PP2OptimizationParserTest >> testAndLiteralObject [
	self assert: $a asPParser and parse: 'a' to: $a end: 0.
]

{ #category : #tests }
PP2OptimizationParserTest >> testAndPop [
	| parser |
	self context defaultStack push: $a.
	parser := $a asPParser pop and.
	parser optimize.
	
	self assert: parser parse: 'a' to: $a end: 0.
	self assert: self context defaultStack top equals: $a.
	self assert: self context defaultStack size equals: 1.
	self assert: (self context countFor: #remember) equals: 1.
]

{ #category : #tests }
PP2OptimizationParserTest >> testAndPopFailure [
	| parser |
	self context defaultStack push: $a.
	parser := $a asPParser pop and.
	parser optimize.
	
	self assert: parser fail: 'b'.
	self assert: self context defaultStack top equals: $a.
	self assert: self context defaultStack size equals: 1.
	self assert: (self context countFor: #remember) equals: 1.
]

{ #category : #tests }
PP2OptimizationParserTest >> testAndPredicateObject [
	self assert: #letter asPParser and parse: 'a' to: $a end: 0.
	self assert: #letter asPParser and parse: 'z' to: $z end: 0.	
	self assert: #letter asPParser and fail: '1' end: 0.
]

{ #category : #tests }
PP2OptimizationParserTest >> testAndPush [
	| parser |
	self context defaultStack push: $b.
	parser := $a asPParser push and.
	parser optimize.
	
	self assert: parser parse: 'a' to: $a end: 0.
	self assert: self context defaultStack top equals: $b.
	self assert: self context defaultStack size equals: 1.
	self assert: (self context countFor: #remember) equals: 1.
]

{ #category : #tests }
PP2OptimizationParserTest >> testAndPushFailure [
	| parser |
	self context defaultStack push: $b.
	parser := $a asPParser push and.
	parser optimize.
	
	self assert: parser fail: 'b'.
	self assert: self context defaultStack top equals: $b.
	self assert: self context defaultStack size equals: 1.
	self assert: (self context countFor: #remember) equals: 1.
]

{ #category : #'tests - seas' }
PP2OptimizationParserTest >> testAnyStarLazyLiteralObject [
	| parser ctx |
	parser := #any asPParser starLazy, $x asPParser.
	parser optimize.
	parser enableDebug.

	ctx := self assert: parser parse: '..x'.
	self assert: ctx returnValue first asArray equals: #($. $.).
	self assert: ctx debugResult steps equals: 4.
	
	ctx := self assert: parser parse: 'x'.
	self assert: ctx returnValue first isEmpty.
	
	self assert: parser fail: '...'.
	self assert: parser fail: '..a'
]

{ #category : #'tests - seas' }
PP2OptimizationParserTest >> testAnyStarLazyPredicateObject [
	| parser ctx |
	parser := #any asPParser starLazy, #letter asPParser.
	parser optimize.
	parser enableDebug.
	
	ctx := self assert: parser parse: '..a'.
	self assert: ctx returnValue first asArray equals: #($. $.).
	self assert: ctx debugResult steps equals: 4.

	ctx := self assert: parser parse: 'a'.
	self assert: ctx returnValue first isEmpty.

	self assert: parser fail: '...'.
	self assert: parser fail: '...1'
]

{ #category : #tests }
PP2OptimizationParserTest >> testCache [
	| counter parser contextOne contextTwo |
	counter := 0.

	parser := [ :ctx | counter := counter + 1. #foo ] asPParser.
	parser strategy: parser strategy cache.
	parser setOptimized.

	contextOne := 'foo' asPetit2Context.
	contextTwo := 'bar' asPetit2Context.
	
	parser parseAdaptableWithContext: contextOne.
	self assert: counter equals: 1.
	
	parser parseAdaptableWithContext: contextOne.
	self assert: counter equals: 2.
	
	contextOne next.
	parser parseAdaptableWithContext: contextOne.
	self assert: counter equals: 3.

	parser parseAdaptableWithContext: contextTwo.
	self assert: counter equals: 4.

	
]

{ #category : #tests }
PP2OptimizationParserTest >> testCache2 [
	| parser context result |
	parser := $a asPParser star.
	parser strategy: parser strategy cache.
	parser setOptimized.
	
	context := 'aaa' asPetit2Context.

	result := parser parseAdaptableWithContext: context.
	self assert: result position equals: 3.
	
	context := 'aabb' asPetit2Context.

	result := parser parseAdaptableWithContext: context.
	self assert: result position equals: 2.
]

{ #category : #'tests - guards' }
PP2OptimizationParserTest >> testGuardChoiceFailure [
	| parserOne parserTwo wrappedOne wrappedTwo result parser |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.

	wrappedOne := parserOne wrapped trim flatten. 
	wrappedTwo := parserTwo wrapped trim flatten.
	parser := wrappedOne / wrappedTwo.
	parser optimize.
	parser enableDebug.
		
	result := self assert: parser fail: 'c'.
	self assert: result debugResult steps equals: 4
]

{ #category : #'tests - guards' }
PP2OptimizationParserTest >> testGuardChoiceOptionOne [
	| parserOne parserTwo wrappedOne wrappedTwo parser result |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.

	wrappedOne := parserOne wrapped trim flatten. 
	wrappedTwo := parserTwo wrapped trim flatten.
	parser := wrappedOne / wrappedTwo.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'a ' to: 'a '.
	self assert: result debugResult steps equals: 8
]

{ #category : #'tests - guards' }
PP2OptimizationParserTest >> testGuardChoiceOptionTwo [
	| parserOne parserTwo wrappedOne wrappedTwo parser result |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.

	wrappedOne := parserOne wrapped trim flatten. 
	wrappedTwo := parserTwo wrapped trim flatten.
	parser := wrappedOne / wrappedTwo.
	parser optimize.
	parser enableDebug.
	
	result := self assert: parser parse: 'b ' to: 'b '.
	self assert: result debugResult steps equals: 9
]

{ #category : #'tests - guards' }
PP2OptimizationParserTest >> testGuardOptional [
	|  wrappedOne parser result |

	wrappedOne := $a asPParser wrapped trim flatten.
	parser := wrappedOne optional.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'a' to: 'a' end: 1.
	self assert: result debugResult steps equals: 8
]

{ #category : #'tests - guards' }
PP2OptimizationParserTest >> testGuardOptionalFailure [
	|  wrappedOne parser result |

	wrappedOne := $a asPParser wrapped trim flatten.
	parser := wrappedOne optional.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'c' to: nil end: 0.
	self assert: result debugResult steps equals: 2
]

{ #category : #'tests - guards' }
PP2OptimizationParserTest >> testGuardPlus [
	| parserOne wrappedOne result parser |
	parserOne := $a asPParser.
	wrappedOne := parserOne wrapped trim flatten. 
	parser := wrappedOne plus.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'a' to: #('a') end: 1.
	self assert: result debugResult steps equals: 13
]

{ #category : #'tests - guards' }
PP2OptimizationParserTest >> testGuardPlusFailure [
	| result parser parserOne wrappedOne |
	parserOne := $a asPParser.
	wrappedOne := parserOne wrapped trim flatten. 
	parser := wrappedOne plus.
	parser optimize.
	parser enableDebug.

	result := self assert: parser fail: 'c'.
	self assert: result debugResult steps equals: 2
]

{ #category : #'tests - guards' }
PP2OptimizationParserTest >> testGuardPlusTwo [
	| parserOne wrappedOne parser result |
	parserOne := $a asPParser.
	wrappedOne := parserOne wrapped trim flatten. 
	parser := wrappedOne plus.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'aa' to: #('a' 'a') end: 2.
	self assert: result debugResult steps equals: 19
]

{ #category : #'tests - guards' }
PP2OptimizationParserTest >> testGuardStar [
	| parser wrappedOne result |

	wrappedOne := $a asPParser wrapped trim flatten. 
	parser := wrappedOne star.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'a' to: #('a') end: 1.
	self assert: result debugResult steps equals: 13.
]

{ #category : #'tests - guards' }
PP2OptimizationParserTest >> testGuardStarEmpty [
	| parser wrappedOne result |

	wrappedOne := $a asPParser wrapped trim flatten. 
	parser := wrappedOne star.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'c' to: #() end: 0.
	self assert: result debugResult steps equals: 2.
]

{ #category : #tests }
PP2OptimizationParserTest >> testLiteralObject [
	
	self assert: $a asPParser flatten parse: 'a'.
]

{ #category : #tests }
PP2OptimizationParserTest >> testLiteralObjectTrimmingToken [
	
	self assert: $a asPParser wrapped token trim parse: '   a   ' toTokenValue: 'a'.
]

{ #category : #tests }
PP2OptimizationParserTest >> testNotLiteral [
	self assert: $a asPParser not parse: 'b' to: nil end: 0.
]

{ #category : #tests }
PP2OptimizationParserTest >> testNotPredicateObject [
	self assert: #letter asPParser not parse: '0' to: nil end: 0.
	self assert: #letter asPParser not parse: '_' to: nil end: 0.	
	self assert: #letter asPParser not fail: 'a' end: 0.
]

{ #category : #'tests - packrat' }
PP2OptimizationParserTest >> testPackrat [
	| packrat parser result |

	packrat := $a asPParser trim memoize.
	parser := packrat and, packrat.
	
	parser optimize.
	parser enableDebug.
	
	result := self assert: parser parse: ' a'.
	self assert: result debugResult steps equals: 8.
]

{ #category : #'tests - packrat' }
PP2OptimizationParserTest >> testPackratContextSensitive [
	| packrat parser result |

	packrat := #letter asPParser match memoize.
	parser := (#letter asPParser push, packrat) and, #letter asPParser push, packrat.
	
	parser optimize.
	parser enableDebug.
	
	result := self assert: parser parse: 'aa'.
	self assert: result debugResult steps equals: 11
]

{ #category : #'tests - packrat' }
PP2OptimizationParserTest >> testPackratContextSensitiveFailure [
	| packrat parser result |

	packrat := #letter asPParser match memoize.
	parser := (#letter asPParser push, packrat) and, #letter asPParser, packrat.
	
	parser optimize.
	parser enableDebug.
	
	result := self assert: parser fail: 'aa' end: 1
]

{ #category : #tests }
PP2OptimizationParserTest >> testSea [
	|  parser island result |
	
	island := $a asPParser plus flatten.
	parser := island sea.

	parser optimize.
	result := parser debug: '..aa..'.
	self assert: result debugResult steps equals: 33.	

]

{ #category : #tests }
PP2OptimizationParserTest >> testSequenceWithPush [
	| parser |
	self context defaultStack push: $x.
	parser := $a asPParser, $b asPParser push, $c asPParser.
	parser optimize.
	
	self assert: parser parse: 'abc'.
	self assert: self context defaultStack top equals: $b.
	self assert: self context defaultStack size equals: 2.
	self assert: (self context countFor: #remember) equals: 1.
]

{ #category : #tests }
PP2OptimizationParserTest >> testSequenceWithPushFailureFirst [
	| parser |
	self context defaultStack push: $x.
	parser := $a asPParser, $b asPParser push, $c asPParser.
	parser optimize.
	
	self assert: parser fail: 'xbc'.
	self assert: self context defaultStack top equals: $x.
	self assert: self context defaultStack size equals: 1.
	self assert: (self context countFor: #remember) equals: 1.
]

{ #category : #tests }
PP2OptimizationParserTest >> testSequenceWithPushFailureLast [
	| parser |
	self context defaultStack push: $x.
	parser := $a asPParser, $b asPParser push, $c asPParser.
	parser optimize.
	
	self assert: parser fail: 'abx' end: 2.
	self assert: self context defaultStack top equals: $x.
	self assert: self context defaultStack size equals: 1.
	self assert: (self context countFor: #remember) equals: 1.
]

{ #category : #tests }
PP2OptimizationParserTest >> testTrimming [
	
	self assert: $a asPParser trim parse: '   a   '.
]
