Extension { #name : #Stream }

{ #category : #'*petitparser2' }
Stream >> asPetit2Context [
	^ self asPetit2Stream asPetit2Context 
]

{ #category : #'*petitparser2' }
Stream >> asPetit2Stream [
	^ PP2BufferStream 
		on: self 
		bufferSize: 4*1024
]
