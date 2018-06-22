visiting
visitOptional: node
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