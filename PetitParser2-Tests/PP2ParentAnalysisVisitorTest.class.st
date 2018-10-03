Class {
	#name : #PP2ParentAnalysisVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor',
		'parent'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #support }
PP2ParentAnalysisVisitorTest >> assert: aCollection includes: anObject [
	self assert: (aCollection includes: anObject) 
]

{ #category : #running }
PP2ParentAnalysisVisitorTest >> setUp [
	visitor := PP2ParentAnalysisVisitor new
]

{ #category : #tests }
PP2ParentAnalysisVisitorTest >> testCycle [
	|  delegateOne delegateTwo |

	delegateOne := PP2DelegateNode new.
	delegateTwo := PP2DelegateNode new.
	delegateOne child: delegateTwo.
	delegateTwo child: delegateOne.
	
	visitor visit: delegateOne.
	
	self assert: delegateOne parents size equals: 1.
	self assert: delegateOne parents includes: delegateTwo.

	self assert: delegateTwo parents size equals: 1.
	self assert: delegateTwo parents includes: delegateOne.
		
]

{ #category : #tests }
PP2ParentAnalysisVisitorTest >> testDeepParent [
	| superParent |
	parser := $a asPParser.
	parent := parser wrapped.
	superParent := parent wrapped.
	
	visitor visit: superParent.
	
	self assert: parser parents anyOne equals: parent.
	self assert: parent parents anyOne equals: superParent.
	self assert: superParent parents isEmpty.
]

{ #category : #tests }
PP2ParentAnalysisVisitorTest >> testMultipleParents [
	| parentOne parentTwo superParent |

	parser := $a asPParser.
	parentOne := parser wrapped.
	parentTwo := parser star.
	superParent := parentOne, parentTwo.
	
	visitor visit: superParent.
	
	self assert: parser parents size equals: 2.
	self assert: parser parents includes: parentOne.
	self assert: parser parents includes: parentTwo.
		
]

{ #category : #tests }
PP2ParentAnalysisVisitorTest >> testNoParent [
	parser := $a asPParser.
	
	visitor visit: parser.
	
	self assert: parser parents isEmpty.
]

{ #category : #tests }
PP2ParentAnalysisVisitorTest >> testParent [
	parser := $a asPParser.
	parent := parser wrapped.
	
	visitor visit: parent.
	
	self assert: parser parents size equals: 1.
	self assert: parent parents isEmpty.
	self assert: parser parents includes: parent.
]

{ #category : #tests }
PP2ParentAnalysisVisitorTest >> testParentOfSequence [
	| parserOne parserTwo |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.
	parent := parserOne, parserTwo.
	
	visitor visit: parent.
	
	self assert: parserOne parents size equals: 1.
	self assert: parserOne parents includes: parent.
	self assert: parserTwo parents size equals: 1.
	self assert: parserTwo parents includes: parent.
	self assert: parent parents isEmpty.
]
