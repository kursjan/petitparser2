Class {
	#name : #BaselineOfPetitParser2Gui,
	#superclass : #BaselineOf,
	#category : 'BaselineOfPetitParser2Gui'
}

{ #category : #baselines }
BaselineOfPetitParser2Gui >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'PetitParser2Gui'.
		spec repository: 'github://kursjan/petitparser2:master'.
		spec baseline: 'PetitParser2' with: [ 
			spec repository: 'github://kursjan/petitparser2:master' ].

		spec baseline: 'Glamour' with: [ 
			spec repository: 'github://moosetechnology/Glamour/src' ].  
		spec for: #'pharo6.x' do: [ 
		   spec baseline: 'Glamour' with: [ 
			spec repository: 'github://moosetechnology/Glamour:pharo6/src' ].  
		].			
			
		spec project: 'Roassal2' with: [
				spec
					versionString: #'stable';
					className: #ConfigurationOfRoassal2;
					repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ].

		spec 
			package: 'PetitParser2-GUI' with: [ 
				spec requires: #('Glamour' 'Roassal2' 'PetitParser2') ];
			package: 'PetitParser2-GUI-Tests' with: [ 
				spec requires: #('PetitParser2-GUI') ];
			package: 'PetitParser2-Benchmarks-GUI' with: [ 
				spec requires: #('PetitParser2') ].
	].
]
