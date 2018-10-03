Class {
	#name : #PP2WebElement,
	#superclass : #Object,
	#category : 'PetitParser2-Html-AST'
}

{ #category : #enumerating }
PP2WebElement >> allElements [
	| result |
	result := OrderedCollection new.
	self allElementsDo: [ :parser | result addLast: parser ].
	^ result
]

{ #category : #enumerating }
PP2WebElement >> allElementsDo: aBlock [
	^ self allElementsDo: aBlock seen: IdentitySet new
]

{ #category : #enumerating }
PP2WebElement >> allElementsDo: aBlock seen: aSet [
	"
		Iterate over all the parse nodes of the receiver, do not visit the ones contained in aSet.
	"

	(aSet includes: self) ifTrue: [ ^ self ].
	aSet add: self.
	
	aBlock value: self.
	self children do: [ :each | each allElementsDo: aBlock seen: aSet ]
]

{ #category : #accessing }
PP2WebElement >> children [
	^ #()
]

{ #category : #accessing }
PP2WebElement >> displayText [
	'abstract element'
]

{ #category : #gui }
PP2WebElement >> gtTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite tree
			title: 'Tree';
			children: [:n | n children ];
			format: [:n| n displayText printStringLimitedTo: 50 ];
			shouldExpandToLevel: 6
]
