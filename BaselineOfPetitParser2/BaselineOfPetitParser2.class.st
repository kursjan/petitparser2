Class {
	#name : #BaselineOfPetitParser2,
	#superclass : #BaselineOf,
	#category : 'BaselineOfPetitParser2'
}

{ #category : #baselines }
BaselineOfPetitParser2 >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'PetitParser2'.
		spec baseline: 'PetitParser2Core' with: [ 
			spec repository: 'github://kursjan/petitparser2:master' ].
		spec baseline: 'PetitParser2PharoExtras' with: [ 
			spec repository: 'github://kursjan/petitparser2:master' ].
		spec baseline: 'PetitParser2Languages' with: [ 
			spec repository: 'github://kursjan/petitparser2:master' ].
	]
]
