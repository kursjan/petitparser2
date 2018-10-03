Class {
	#name : #JavascriptElement,
	#superclass : #WebElement,
	#instVars : [
		'code'
	],
	#category : 'PetitParser2-Tutorial'
}

{ #category : #accessing }
JavascriptElement >> code [
	^ code

]

{ #category : #accessing }
JavascriptElement >> code: anObject [
	code := anObject

]

{ #category : #accessing }
JavascriptElement >> displayText [
	^ self code

]

{ #category : #gt }
JavascriptElement >> gtText: composite [
	<gtInspectorPresentationOrder: 40>
	
	composite text
		title: 'Text';
		display: [ :context | code ]

]
