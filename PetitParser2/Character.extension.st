Extension { #name : #Character }

{ #category : #'*petitparser2' }
Character >> asPParser [
	"Answer a parser that accepts the receiving character."
	
	^ PP2LiteralObjectNode on: self
]
