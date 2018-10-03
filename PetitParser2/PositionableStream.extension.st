Extension { #name : #PositionableStream }

{ #category : #'*petitparser2' }
PositionableStream >> asPetit2Stream [
	^ PP2Stream on: collection
]
