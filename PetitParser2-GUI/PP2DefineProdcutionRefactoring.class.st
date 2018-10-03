Class {
	#name : #PP2DefineProdcutionRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'class',
		'source',
		'protocols',
		'method'
	],
	#category : 'PetitParser2-GUI-Refactoring'
}

{ #category : #'instance creation' }
PP2DefineProdcutionRefactoring class >> onClass: aClass source: aString protocols: anArray [
	^ self new
		setClass: aClass;
		setSource: aString;
		setProtocols: anArray;
		yourself
]

{ #category : #private }
PP2DefineProdcutionRefactoring >> checkSource [
	| rewriter |
	method := RBParser
		parseMethod: source
		onError: [ :string :position | ^ false ].
	rewriter := self sourceRewriter.
	[ rewriter executeTree: method ]
		whileTrue: [ method := rewriter tree ].
	^ method selector isUnary
]

{ #category : #preconditions }
PP2DefineProdcutionRefactoring >> preconditions [
	^ (self checkCompositeParser2: class)
		& (RBCondition withBlock: [ self checkSource ] errorString: 'Unable to parse source code')
]

{ #category : #accessing }
PP2DefineProdcutionRefactoring >> selector [
	^ method selector
]

{ #category : #initialization }
PP2DefineProdcutionRefactoring >> setClass: aClass [
	class := self classObjectFor: aClass
]

{ #category : #initialization }
PP2DefineProdcutionRefactoring >> setProtocols: anArray [
	protocols := anArray
]

{ #category : #initialization }
PP2DefineProdcutionRefactoring >> setSource: aString [
	source := aString
]

{ #category : #private }
PP2DefineProdcutionRefactoring >> sourceRewriter [
	^ RBParseTreeRewriter new
		replace: '`#literal' with: '`#literal asParser' when: [ :node |
			(node isLiteralNode and: [ node value isString or: [ node value isCharacter ] ])
				and: [ (node parent isNil or: [ node parent isMessage not or: [ node parent selector ~= #asPParser ] ])
				and: [ (node parents noneSatisfy: [ :each | each isBlock ]) ] ] ];
		replaceMethod: '`@method: `@args | `@temps | ``@.statements. ``.statement `{ :node | node isReturn not }' 
			with: '`@method: `@args | `@temps | ``@.statements. ^ ``.statement';
		yourself
]

{ #category : #transforming }
PP2DefineProdcutionRefactoring >> transform [
	(class definesInstanceVariable: method selector asString)
		ifFalse: [ class addInstanceVariable: method selector asString ].
	class compile: method newSource classified: protocols
]
