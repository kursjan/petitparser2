visiting
visitPossesiveRepeating: node
	| classification |
	"repetition is kind of sequence:"
	guarded push: anythingClassification.
	
	classification := self classificationFor: node child.
	(self guardOf: classification makesSenseFor: node child) ifTrue: [  
		node child strategy: (node child strategy choiceAlternativeGuard: classification).
		self visit: node child guardedWith: classification
	] ifFalse: [  
		self visit: node child
	].
	guarded pop.