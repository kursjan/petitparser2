Class {
	#name : #GLMExpressionHighlighterTextStyler,
	#superclass : #GLMHighlighterTextStylerDecorator,
	#instVars : [
		'parser',
		'context'
	],
	#category : 'PetitParser2-GUI-Highlighting'
}

{ #category : #'as yet unclassified' }
GLMExpressionHighlighterTextStyler class >> example [
	<example>
	| input presentation composite |
	input := PP2Sources current expressionOfSize: 500.
	presentation := GLMRubricHighlightedTextPresentation new
		title: 'Source';
		editingMode: [ GLMHighlighterTextRubEditingMode withStylerDecorator: GLMExpressionHighlighterTextStyler new].
	composite := GLMCompositePresentation new.
	composite custom: presentation.
	composite openOn: input.
]

{ #category : #'as yet unclassified' }
GLMExpressionHighlighterTextStyler >> context: aString [
	(context isNil or: [context size ~= aString size]) ifTrue: [
		context := aString asReparsableContext
	].

	^ context
]

{ #category : #'as yet unclassified' }
GLMExpressionHighlighterTextStyler >> defaultStyler [
	^ GLMHighlighterTextParserStyler new
		view: self;
		parser: self
]

{ #category : #'as yet unclassified' }
GLMExpressionHighlighterTextStyler >> initialize [
	super initialize.
	
	parser := PP2ExpressionHighlighter new optimize enableDebug
]

{ #category : #'as yet unclassified' }
GLMExpressionHighlighterTextStyler >> parse: aString onError: anError [
	| result highlightedText time |
	
	time := [ result := parser reparseWithContext: (self context: aString) ] timeToRun.
	Transcript crShow: 'parsed in: ', time asMilliSeconds asString, 'ms'.
	Transcript show: ' context: ', context identityHash asString.
	Transcript show: ' steps: ', context debugResult steps asString.
	
	highlightedText := aString asText.
	result isPetit2Success ifTrue: [  
		result returnValue asCollection deepFlatten do: [ :el | 
			el isToken ifTrue: [ highlightedText addAttribute: el color from: el start to: el stop ] ]
	] ifFalse: [ 
		highlightedText addAttribute: TextColor red.
	].
	
	^ highlightedText.
]

{ #category : #'as yet unclassified' }
GLMExpressionHighlighterTextStyler >> replaceFrom: start to: stop with: aText [
	super replaceFrom: start to: stop with: aText.
	
	context ifNotNil: [  
		(start > stop and: [aText string size = 1]) ifTrue: [  
			context applyChange: (PP2InsertCharacter new
				position: start;
				input: text string;
				yourself)
		]
	].

]
