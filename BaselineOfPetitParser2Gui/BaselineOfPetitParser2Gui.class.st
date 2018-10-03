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

		spec project: 'Glamour' with: [
			spec
				versionString: #'stable';
				className: 'ConfigurationOfGlamour';
				repository: 'http://www.smalltalkhub.com/mc/Moose/Glamour/main' ].
			
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

	spec for: #'pharo5.x' do: [
		spec project: 'GToolkit' with: [
				spec
					className: #ConfigurationOfGToolkit;
					versionString: #'stable';
					repository: 'http://www.smalltalkhub.com/mc/Moose/GToolkit/main' ].
	].

]
