Class {
	#name : #PP2JavascriptElement,
	#superclass : #PP2WebElement,
	#instVars : [
		'code'
	],
	#category : 'PetitParser2-Html-AST'
}

{ #category : #accessing }
PP2JavascriptElement >> code [
	^ code
]

{ #category : #accessing }
PP2JavascriptElement >> code: anObject [
	code := anObject
]

{ #category : #accessing }
PP2JavascriptElement >> displayText [
	^ self code
]

{ #category : #gt }
PP2JavascriptElement >> gtText: composite [
	<gtInspectorPresentationOrder: 40>
	
	composite text
		title: 'Text';
		display: [ :context | code ]

]
