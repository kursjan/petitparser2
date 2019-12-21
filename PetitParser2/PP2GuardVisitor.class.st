Class {
	#name : #PP2GuardVisitor,
	#superclass : #PP2NoopVisitor,
	#instVars : [
		'guarded',
		'anythingClassification'
	],
	#category : #'PetitParser2-Optimizations'
}

{ #category : #support }
PP2GuardVisitor >> classificationFor: node [
	| classification charSet firstSet |
	classification := Array new: 255 withAll: false.

	firstSet := node firstSet.
	firstSet do: [ :first |  
		charSet := first firstCharSet.
		
		charSet isUnknown ifTrue: [ ^ anythingClassification  ].
		
		charSet classification withIndexDo: [ :value :index |  
			value ifTrue: [ classification at: index put: true ]
		]
	].

	^ classification
]

{ #category : #optimizations }
PP2GuardVisitor >> doPass: node [
	self visit: node
]

{ #category : #support }
PP2GuardVisitor >> guardOf: classification makesSenseFor: node [
	| size allNodesSize |
	allNodesSize := node propertyAt: #allNodesSize ifAbsentPut: [ node allNodes size ].
	
	"if there are too little children, the overhead of a guard is too high"
	(allNodesSize < 4) ifTrue: [ ^ false ].

	size := ((1 to: 255) 	collect: [ :index | classification at: index ]
							  	thenSelect: [ :e | e ]) size.

	"if guard passes for so many characters, it is probably(!!!) better not to guard"
	(size > 250) ifTrue: [ ^ false ].
								
	"for small parsers"
	(allNodesSize < 20 and: [size > 128 ]) ifTrue: [ ^ false ].
	
	
	"It is already guarded"
	(self isWellGuarded: classification) ifTrue: [ ^ false ].
	
	^ true
]

{ #category : #initialization }
PP2GuardVisitor >> initialize [
	super initialize.
	
	anythingClassification := (Array new: 255 withAll: true).
	guarded := Stack with: anythingClassification.
	
]

{ #category : #testing }
PP2GuardVisitor >> isGuarded [
	^ guarded isEmpty
]

{ #category : #testing }
PP2GuardVisitor >> isWellGuarded: classification [
	| topClassification changes |
	topClassification := guarded top.
	changes := 0.
	
	topClassification with: classification do: [ :topC :localC |
		localC ifTrue: [ self assert: topC ].

		"is single change enough?"		
		(topC and: localC not) ifTrue: [  
			changes := changes + 1.
		].	
	].


	^ changes == 0
	"
		(DiffMorph 
		from: (topClassification joinUsing: Character lf) 
		to: (classification joinUsing: Character lf)) openInWindow
	"
]

{ #category : #support }
PP2GuardVisitor >> visit: node guardedWith: classification [
	guarded push: classification.
	self visit: node.
	guarded pop.
	
]

{ #category : #visiting }
PP2GuardVisitor >> visitChoice: node [
	| alternatives classification |

	alternatives := node children.

	alternatives do: [ :alternative | 
		classification := self classificationFor: alternative.
		(self guardOf: classification makesSenseFor: alternative) ifTrue: [  
			alternative strategy: (alternative strategy parsingGuard: classification).
			self visit: alternative guardedWith: classification
		] ifFalse: [  
			self visit: alternative
		]
	].


]

{ #category : #visiting }
PP2GuardVisitor >> visitDelegate: node [
	| classification |
	(node children size = 1) ifFalse: [ ^ super visitDelegate: node ].
	
	classification := self classificationFor: node.
	(self guardOf: classification makesSenseFor: node) ifTrue: [  
		node strategy: (node strategy parsingGuard: classification).
		self visit: node child guardedWith: classification
	] ifFalse: [  
		self visit: node child
	]
]

{ #category : #visiting }
PP2GuardVisitor >> visitOptional: node [
	| classification |

	"
		Classify for the child, because classification for optional contains always 'true'
		and therefore makes not much sense.
	"
	classification := self classificationFor: node child.
	(self guardOf: classification makesSenseFor: node) ifTrue: [  
		node strategy: (node strategy parsingGuard: classification).
		self visit: node child guardedWith: classification
	] ifFalse: [
		self visit: node child
	]
]

{ #category : #visiting }
PP2GuardVisitor >> visitPossesiveRepeating: node [
	| classification |
	
	classification := self classificationFor: node child.
	(self guardOf: classification makesSenseFor: node) ifTrue: [ 
		node strategy: (node strategy parsingGuard: classification).
	].
	
	"repetition is kind of sequence, so all but first are not really guarded"
	self visitUnguarded: node child
]

{ #category : #visiting }
PP2GuardVisitor >> visitSequence: node [
	self visit: node firstChild.
	
	node children allButFirst do: [ :child |
		self visitUnguarded: child.
	].


]

{ #category : #visiting }
PP2GuardVisitor >> visitTrimming: node [
	| trimmerClassification topClassification childClassification |
	trimmerClassification := self classificationFor: node trimmer.
	childClassification := self classificationFor: node child. 

	topClassification := guarded top copy.
	
	1 to: 255 do: [ :index |
		| topC trimC childC |
		topC := topClassification at: index.
		trimC := trimmerClassification at: index.
		childC := childClassification at: index.
		
		"child is not, but top is"
		(childC not and: topC) ifTrue: [  
			"actually, caused by trimmer"
			trimC ifTrue: [ topClassification at: index put: false ]
		]
	].
	"visit the child without the classification caused by trimmer"
	self visit: node child guardedWith: topClassification
]

{ #category : #support }
PP2GuardVisitor >> visitUnguarded: node [
	^ self visit: node guardedWith: anythingClassification 
]
