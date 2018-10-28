Extension { #name : #PP2DebugResult }

{ #category : #'*PetitParser2-GUI' }
PP2DebugResult >> allowsDebug [
	^ true
]

{ #category : #'*PetitParser2-GUI' }
PP2DebugResult >> asEventsMorph [
	invocationEntry isNil ifTrue: [ ^ Morph new ].
	
	^ (self findContext eventsTrace)
		selection: invocationEntry;
		eventsMorph
]
