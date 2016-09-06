visiting
visitOptional: node
	| classification |

	"we get classification for the child, because classification for myself contains contains only 'true'"
	classification := self classificationFor: node child.
	(self guardOf: classification makesSenseFor: node) ifTrue: [  
		node strategy: (node strategy parsingGuard: classification).
		self visit: node child guardedWith: classification
	] ifFalse: [
		self visit: node child
	]