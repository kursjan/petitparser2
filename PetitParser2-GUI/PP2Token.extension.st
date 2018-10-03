Extension { #name : #PP2Token }

{ #category : #'*PetitParser2-GUI' }
PP2Token >> color [
	^ self propertyAt: #color ifAbsent: [ TextColor black ]
]

{ #category : #'*PetitParser2-GUI' }
PP2Token >> color: color [
	self propertyAt: #color put: color
]
