"
Pacakage for Pharo specific extension.

PharoExtras are referenced from PetitParser2, but not from PetitParser2-Core.
"
Class {
	#name : #BaselineOfPetitParser2PharoExtras,
	#superclass : #BaselineOf,
	#category : #BaselineOfPetitParser2PharoExtras
}

{ #category : #baselines }
BaselineOfPetitParser2PharoExtras >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec description: 'PetitParser2PharoExtras'.
			spec 
				package: 'PetitParser2';			
				package: 'PetitParser2-PharoExtras' with: [ 
					spec requires: #('PetitParser2') ] 
		]
]
