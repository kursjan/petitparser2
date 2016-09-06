visiting
visitPossesiveRepeating: node
	| classification |
	
	classification := self classificationFor: node child.
	(self guardOf: classification makesSenseFor: node) ifTrue: [ 
		node strategy: (node strategy parsingGuard: classification).
	].
	
	"repetition is kind of sequence, so all but first are not really guarded"
	self visitUnguarded: node child