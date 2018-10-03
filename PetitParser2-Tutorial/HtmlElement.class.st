Class {
	#name : #HtmlElement,
	#superclass : #WebElement,
	#instVars : [
		'name',
		'children'
	],
	#category : 'PetitParser2-Tutorial'
}

{ #category : #accessing }
HtmlElement >> children [
	^ children

]

{ #category : #accessing }
HtmlElement >> children: anObject [
	children := anObject

]

{ #category : #accessing }
HtmlElement >> displayText [
	^ self name

]

{ #category : #accessing }
HtmlElement >> name [
	^ name

]

{ #category : #accessing }
HtmlElement >> name: newName [
	name := newName

]
