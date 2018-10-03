Extension { #name : #BlockClosure }

{ #category : #'*PetitParser2' }
BlockClosure >> asCharSetPredicate [
	^ PP2CharSetPredicate on: self
]

{ #category : #'*PetitParser2' }
BlockClosure >> asPParser [
	"Answer a parser implemented in the receiving one-argument block."

	^ PP2PluggableNode on: self
]
