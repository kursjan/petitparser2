Class {
	#name : #PP2ContextChangesVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor'
	],
	#category : 'PetitParser2-Tests-Analysis'
}

{ #category : #asserting }
PP2ContextChangesVisitorTest >> assertChangesContext: node [
	self assert: (visitor visit: node) isContextChange
]

{ #category : #asserting }
PP2ContextChangesVisitorTest >> assertPop: node [
	self assert: (visitor visit: node) isContextPop
]

{ #category : #asserting }
PP2ContextChangesVisitorTest >> assertPush: node [
	self assert: (visitor visit: node) isContextPush
]

{ #category : #asserting }
PP2ContextChangesVisitorTest >> denyChangesContext: node [
	self deny: (visitor visit: node) isContextChange
]

{ #category : #asserting }
PP2ContextChangesVisitorTest >> denyPop: node [
	self deny: (visitor visit: node) isContextPop
]

{ #category : #asserting }
PP2ContextChangesVisitorTest >> denyPush: node [
	self deny: (visitor visit: node) isContextPush
]

{ #category : #running }
PP2ContextChangesVisitorTest >> setUp [
	visitor := PP2ContextChangesVisitor new
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testAnd [
	parser := $a asPParser and.
	
	self denyChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testAndPush [
	parser := $a asPParser push and.
	
	self denyChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testChoice [
	parser := $a asPParser / $b asPParser.
	
	self denyChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testChoicePopPop [
	parser := $a asPParser pop / $b asPParser pop.
	
	self assertChangesContext: parser.
	self assertPop: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testChoicePushPop [
	parser := $a asPParser push / $b asPParser pop.
	
	self assertChangesContext: parser.
	self denyPush: parser.
	self denyPop: parser.
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testChoicePushPush [
	parser := $a asPParser push / $b asPParser push.
	
	self assertChangesContext: parser.
	self assertPush: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testChoiceWithPop [
	parser := $a asPParser / $b asPParser pop.
	
	self assertChangesContext: parser.
	self denyPop: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testDelegate [
	parser := $a asPParser wrapped.
	
	self denyChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testDelegatePop [
	parser := $a asPParser pop wrapped.
	
	self assertPop: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testDelegatePush [
	parser := $a asPParser push wrapped.
	
	self assertPush: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testEpsilon [
	parser := #epsilon asPParser.
	
	self denyChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testLiteralObject [
	parser := $a asPParser.
	
	self denyChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testMatch [
	parser := $a asPParser match.
	
	self denyChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testOptional [
	parser := $a asPParser optional.
	
	self denyChangesContext: parser.
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testOptionalPop [
	parser := $a asPParser pop optional.
	
	self assertChangesContext: parser.
	self denyPop: parser.
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testOptionalPush [
	parser := $a asPParser push optional.
	
	self assertChangesContext: parser.
	self denyPush: parser.
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testPop [
	parser := $a asPParser pop.
	
	self assertChangesContext: parser.
	self assertPop: parser.
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testPopOfPop [
	parser := $a asPParser pop pop.
	
	self assertChangesContext: parser.
	self denyPop: parser.
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testPush [
	parser := $a asPParser push.
	
	self assertChangesContext: parser.
	self assertPush: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testPushOfPush [
	parser := $a asPParser push push.
	
	self assertChangesContext: parser.
	self denyPush: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testRepetition [
	parser := $a asPParser star.
	
	self denyChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testRepetitionPop [
	parser := $a asPParser pop star.
	
	self assertChangesContext: parser.
	self denyPush: parser.
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testRepetitionPush [
	parser := $a asPParser push star.
	
	self assertChangesContext: parser.
	self denyPush: parser.
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testSequence [
	parser := $a asPParser, $b asPParser.
	
	self denyChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testSequenceWithPop [
	parser := $a asPParser, ($b asPParser pop).
	
	self assertChangesContext: parser.
	self assertPop: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testSequenceWithPopPush [
	parser := $a asPParser pop, $b asPParser push.
	
	self assertChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testSequenceWithPush [
	parser := $a asPParser, $b asPParser push.
	
	self assertChangesContext: parser.
	self assertPush: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testSequenceWithPushPop [
	parser := $a asPParser push, $b asPParser pop.
	
	self denyChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testWrapping [
	parser := $a asPParser >=> [ :ctx :cc | cc value ].
	
	self assertChangesContext: parser
]

{ #category : #tests }
PP2ContextChangesVisitorTest >> testWrappingSetProperty [
	parser := $a asPParser >=> [ :ctx :cc | cc value ]
		contextChanges: PP2CcChange noChange;
		yourself.
	
	 self denyChangesContext: parser
]
