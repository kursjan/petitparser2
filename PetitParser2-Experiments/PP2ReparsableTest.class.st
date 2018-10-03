Class {
	#name : #PP2ReparsableTest,
	#superclass : #TestCase,
	#instVars : [
		'context',
		'memoized',
		'parser'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #tests }
PP2ReparsableTest >> testMemoHit [
	memoized := $a asPParser plus.
	memoized strategy: (PP2Reparsable on: memoized strategy).
	
	parser := (memoized, $b asPParser) / (memoized, $c asPParser).
	parser setOptimized.
	
	context := parser parseWithContext: 'aac' asReparsableContext.
	
	self assert: context debugResult allResults size equals: 11.
	self assert: context returnValue size equals: 2.
	self assert: context returnValue first size equals: 2.
	self assert: context returnValue first first equals: $a.
	self assert: context returnValue second equals: $c.

]

{ #category : #tests }
PP2ReparsableTest >> testMemoMiss [
	memoized := $a asPParser plus.
	memoized strategy: (PP2Reparsable on: memoized strategy).
	
	
	parser := (memoized, $b asPParser) / ($a asPParser, memoized).
	parser setOptimized.
	
	context := parser parseWithContext: 'aaa' asReparsableContext.
	
	self assert: context debugResult steps equals: 15.
	self assert: context returnValue size equals: 2.
	self assert: context returnValue first equals: $a.
	self assert: context returnValue second first equals: $a.
	
]

{ #category : #tests }
PP2ReparsableTest >> testParseAndParse [
	parser := $a asPParser plus.
	parser strategy: (PP2Reparsable on: parser strategy).
	parser setOptimized.
	parser enableDebug.
	
	context := parser parseWithContext: 'aa' asReparsableContext.
	self assert: context debugResult steps equals: 5.
	
	context := parser parseWithContext: context asReparsableContext.
	self assert: context debugResult steps equals: 5.
]

{ #category : #tests }
PP2ReparsableTest >> testReparse [
	| startContext |
	parser := $a asPParser plus.
	parser strategy: (PP2Reparsable on: parser strategy).
	parser setOptimized.
	parser enableDebug.
	
	startContext := 'aa' asReparsableContext.
	
	context := parser parseWithContext: startContext.
	self assert: context debugResult steps equals: 5.
	
	context := parser reparseWithContext: context.
	self assert: context debugResult steps equals: 2.
]
