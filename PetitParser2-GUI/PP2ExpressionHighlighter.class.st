Class {
	#name : #PP2ExpressionHighlighter,
	#superclass : #PP2ExpressionGrammar,
	#category : 'PetitParser2-GUI-Highlighting'
}

{ #category : #'as yet unclassified' }
PP2ExpressionHighlighter class >> example [
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

{ #category : #accessing }
PP2ExpressionHighlighter >> closeBracket [
	^ super closeBracket token ==> [ :token | token color: TextColor magenta ]
]

{ #category : #accessing }
PP2ExpressionHighlighter >> number [
	^ super number token ==> [ :token | token color: TextColor blue ]
]

{ #category : #accessing }
PP2ExpressionHighlighter >> openBracket [
	^ super openBracket token ==> [ :token | token color: TextColor magenta ]
]

{ #category : #accessing }
PP2ExpressionHighlighter >> terms [
	^ super terms reparsable
]
