Class {
	#name : #PP2HtmlElement,
	#superclass : #PP2WebElement,
	#instVars : [
		'name',
		'children'
	],
	#category : 'PetitParser2-Html-AST'
}

{ #category : #accessing }
PP2HtmlElement >> children [
	^ children
]

{ #category : #accessing }
PP2HtmlElement >> children: anObject [
	children := anObject
]

{ #category : #accessing }
PP2HtmlElement >> displayText [
	^ self name
]

{ #category : #accessing }
PP2HtmlElement >> firstChild [
	^ self children first
]

{ #category : #accessing }
PP2HtmlElement >> name [
	^ name
]

{ #category : #accessing }
PP2HtmlElement >> name: newName [
	name := newName
	
]

{ #category : #accessing }
PP2HtmlElement >> secondChild [
	^ self children second
]
