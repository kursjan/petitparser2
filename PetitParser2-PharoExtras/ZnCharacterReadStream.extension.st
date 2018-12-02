Extension { #name : #ZnCharacterReadStream }

{ #category : #'*PetitParser2-PharoExtras' }
ZnCharacterReadStream >> asPetit2Stream [
	^ PP2BufferStream on: self
]
