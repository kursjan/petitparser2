Class {
	#name : #PP2HtmlText,
	#superclass : #PP2WebElement,
	#instVars : [
		'text'
	],
	#category : 'PetitParser2-Html-AST'
}

{ #category : #accessing }
PP2HtmlText >> displayText [
	^ self text trim
]

{ #category : #gt }
PP2HtmlText >> gtText: composite [
	<gtInspectorPresentationOrder: 40>
	
	composite text
		title: 'Text';
		display: [ :context | text ]

]

{ #category : #accessing }
PP2HtmlText >> text [
	^ text
]

{ #category : #accessing }
PP2HtmlText >> text: anObject [
	text := anObject
]
