Class {
	#name : #PP2ParseNode,
	#superclass : #Object,
	#instVars : [
		'children',
		'completeSource',
		'startPosition',
		'stopPosition',
		'parent',
		'name'
	],
	#category : 'PetitParser2-RewriteEngine-Core'
}

{ #category : #enumerating }
PP2ParseNode >> allGettersDo: aBlock [
	"
	 Map	`children at: 1` to #first, 
			`children at: 2` to #second,
			etc ...
	"
	(self allNumerals copyFrom: 1 to: children size) do: aBlock.
	self allVariableSelectors
		do: [ :sel | (self perform: sel) do: aBlock ]
]

{ #category : #variables }
PP2ParseNode >> allNumerals [
	^ #(#first #second #third #fourth)
]

{ #category : #variables }
PP2ParseNode >> allVariableSelectors [
	^ #(#nodeVariables)
]

{ #category : #accessing }
PP2ParseNode >> children [
	^ children
]

{ #category : #accessing }
PP2ParseNode >> children: collection [
	collection do: [ :each | each parent: self ].
	children := OrderedCollection withAll: collection
]

{ #category : #accessing }
PP2ParseNode >> completeSource [
	^ parent isNil
		ifTrue: [ completeSource ]
		ifFalse: [ parent completeSource ]
]

{ #category : #accessing }
PP2ParseNode >> completeSource: source [
	completeSource := source
]

{ #category : #accessing }
PP2ParseNode >> first [
	^ children at: 1
]

{ #category : #gui }
PP2ParseNode >> gtTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite tree
			title: 'Tree';
			children: [:n | n isParseNode ifTrue: [n children ] ifFalse: [ Array new ] ];
			format: [:n| n asString ];
			shouldExpandToLevel: 6
]

{ #category : #testing }
PP2ParseNode >> isParseNode [
	^ true
]

{ #category : #matching }
PP2ParseNode >> match: parseNode inContext: aDictionary [
	^ parseNode isParseNode
		and: [ self children size = parseNode children size
				and: [ self children
						with: parseNode children
						do: [ :first :second | 
							(first match: second inContext: aDictionary)
								ifFalse: [ ^ false ] ].
					true ] ]
]

{ #category : #accessing }
PP2ParseNode >> name [
	^ name
]

{ #category : #accessing }
PP2ParseNode >> name: anObject [
	name := anObject
]

{ #category : #variables }
PP2ParseNode >> nodeVariables [
	^ #()
]

{ #category : #enumerating }
PP2ParseNode >> nodesDo: aBlock [
	children do: aBlock
]

{ #category : #accessing }
PP2ParseNode >> parent [
	^ parent
]

{ #category : #accessing }
PP2ParseNode >> parent: anObject [
	parent := anObject
]

{ #category : #printing }
PP2ParseNode >> printOn: aStream [
	super printOn: aStream.
	
	name isNil ifFalse: [ 
		aStream nextPut: $(.
		name printOn: aStream.
		aStream nextPut: $).
	]
]

{ #category : #accessing }
PP2ParseNode >> second [
	^ children at: 2
]

{ #category : #accessing }
PP2ParseNode >> source [
	^ self completeSource
		ifNotNil:
			[ :value | (value copyFrom: self startPosition to: self stopPosition) asString ]
]

{ #category : #accessing }
PP2ParseNode >> startPosition [
	^ startPosition
]

{ #category : #accessing }
PP2ParseNode >> startPosition: anObject [
	startPosition := anObject
]

{ #category : #accessing }
PP2ParseNode >> stopPosition [
	^ stopPosition
]

{ #category : #accessing }
PP2ParseNode >> stopPosition: anObject [
	stopPosition := anObject
]

{ #category : #accessing }
PP2ParseNode >> third [
	^ children at: 3
]
