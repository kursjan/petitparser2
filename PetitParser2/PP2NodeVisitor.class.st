"
Defines base interface for PP2Node visitors.
"
Class {
	#name : #PP2NodeVisitor,
	#superclass : #Object,
	#category : #'PetitParser2-Core'
}

{ #category : #visiting }
PP2NodeVisitor >> visit: aPP2Parser [
	^ aPP2Parser accept: self
]

{ #category : #visiting }
PP2NodeVisitor >> visitAction: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitAdaptable: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitAnd: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitChoice: aPP2Parser [
	^ self visitPP2Node: aPP2Parser

]

{ #category : #visiting }
PP2NodeVisitor >> visitComposite: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitDelegate: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitEnd: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitEndOfInput: node [
	^ self visitPP2Node: node
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitEndOfLine: node [
	^ self visitPP2Node: node
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitEpsilon: node [
	^ self visitPP2Node: node
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitFailing: node [
	^ self visitPP2Node: node
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitFlatten: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitLiteralObject: aPP2Parser [
	^ self visitPP2Node: aPP2Parser

]

{ #category : #visiting }
PP2NodeVisitor >> visitLiteralSequence: aPP2Parser [
	^ self visitPP2Node: aPP2Parser

]

{ #category : #visiting }
PP2NodeVisitor >> visitMapping: aPP2Parser [
	^ self visitPP2Node: aPP2Parser

	
]

{ #category : #visiting }
PP2NodeVisitor >> visitMatch: node [
	^ self visitPP2Node: node
]

{ #category : #visiting }
PP2NodeVisitor >> visitNewLine: node [
	^ self visitPP2Node: node
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitNewline: node [
	^ self visitPP2Node: node
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitNonEpsilon: node [
	^ self visitPP2Node: node
]

{ #category : #visiting }
PP2NodeVisitor >> visitNot: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitOptional: aPP2Parser [
	^ self visitPP2Node: aPP2Parser

]

{ #category : #visiting }
PP2NodeVisitor >> visitPP2Node: aPP2Node [
	"nothing to do here"	

]

{ #category : #visiting }
PP2NodeVisitor >> visitPluggable: aPP2Parser [
	^ self visitPP2Node: aPP2Parser

]

{ #category : #visiting }
PP2NodeVisitor >> visitPop: node [
	^ self visitPP2Node: node
]

{ #category : #visiting }
PP2NodeVisitor >> visitPossesiveRepeating: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitPredicateObject: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitPredicateSequence: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitPush: node [
	^ self visitPP2Node: node
]

{ #category : #visiting }
PP2NodeVisitor >> visitSea: node [
	^ self visitPP2Node: node
]

{ #category : #visiting }
PP2NodeVisitor >> visitSequence: aPP2Parser [
	^ self visitPP2Node: aPP2Parser

]

{ #category : #visiting }
PP2NodeVisitor >> visitStartOfLine: node [
	^ self visitPP2Node: node
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitToken: aPP2Parser [
	^ self visitPP2Node: aPP2Parser

	
]

{ #category : #visiting }
PP2NodeVisitor >> visitTrimming: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitTrimmingToken: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitUnresolved: node [
	^ self visitPP2Node: node
	
]

{ #category : #visiting }
PP2NodeVisitor >> visitWater: node [
	^ self visitPP2Node: node
]

{ #category : #visiting }
PP2NodeVisitor >> visitWrapping: aPP2Parser [
	^ self visitPP2Node: aPP2Parser
	
]
