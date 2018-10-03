Extension { #name : #SequenceableCollection }

{ #category : #'*petitparser2' }
SequenceableCollection >> asPetit2Context [
	^ PP2InMemoryContext on: self position: 0
]

{ #category : #'*petitparser2' }
SequenceableCollection >> asPetit2Stream [
	^ PP2Stream on: self
	"^ PP2BufferStream on: (ReadStream on: self)"
]
