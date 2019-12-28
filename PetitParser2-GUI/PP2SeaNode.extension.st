Extension { #name : #PP2SeaNode }

{ #category : #'*PetitParser2-GUI-Morhpic' }
PP2SeaNode >> exampleOn: aStream [ 
	self beforeWater exampleOn: aStream.
	self island exampleOn: aStream.
	self afterWater exampleOn: aStream.

]
