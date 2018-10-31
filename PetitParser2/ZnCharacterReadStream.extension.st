Extension { #name : #ZnCharacterReadStream }

{ #category : #'*PetitParser2' }
ZnCharacterReadStream >> asPetit2Stream [
	^ PP2BufferStream on: self
]
