Class {
	#name : #UnknownText,
	#superclass : #WebElement,
	#instVars : [
		'text'
	],
	#category : 'PetitParser2-Tutorial'
}

{ #category : #accessing }
UnknownText >> displayText [
	^ self text trim

]

{ #category : #gt }
UnknownText >> gtText: composite [
	<gtInspectorPresentationOrder: 40>
	
	composite text
		title: 'Text';
		display: [ :context | text ]

]

{ #category : #accessing }
UnknownText >> text [
	^ text

]

{ #category : #accessing }
UnknownText >> text: anObject [
	text := anObject

]
