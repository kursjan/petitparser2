Class {
	#name : #BaselineOfPetitParser2Gui,
	#superclass : #BaselineOf,
	#category : #BaselineOfPetitParser2Gui
}

{ #category : #baselines }
BaselineOfPetitParser2Gui >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'PetitParser2Gui'.
		spec baseline: 'PetitParser2' with: [ 
			spec repository: 'github://kursjan/petitparser2:master' ].

		spec 
			package: 'PetitParser2-GUI' with: [ 
				spec requires: #('PetitParser2') ];
			package: 'PetitParser2-GUI-Tests' with: [ 
				spec requires: #('PetitParser2-GUI') ];
			package: 'PetitParser2-Benchmarks-GUI' with: [ 
				spec requires: #('PetitParser2') ].
	].

	spec for: #(#'pharo8.x' #'pharo9.x') do: [	 
		spec baseline: 'EventRecorder' with: [
			spec  repository: 'github://pharo-contributions/EventRecorder:legacy' ].
		
		"Use the same roassal version as Moose 8."
		spec baseline: 'Roassal2' with: [
			spec 
				loads: 'Minimal';
				repository: 'github://ObjectProfile/Roassal2:3a54a7c67af13b23eb6bcfd762ca98b6f11dc1ca/src' ].
		spec 
			package: 'PetitParser2-GUI' with: [ 
				spec requires: #('EventRecorder' 'Roassal2') ].
	].

	spec for: #'pharo7.x' do: [	 
		spec baseline: 'Glamour' with: [ 
			spec repository: 'github://moosetechnology/Glamour/src' ].  	
			
		"In Moose 7, the version for Pharo 7, Roassal was merged within Moose."
		spec baseline: 'Moose' with: [
			spec 	
				loads: #('Trachel' 'Roassal2' 'Roassal2GT');
				repository: 'github://moosetechnology/Moose:v7.x.x/src' ].
		spec 
			package: 'PetitParser2-GUI' with: [ 
				spec requires: #('Glamour' 'Moose') ].
	].

	spec for: #'pharo6.x' do: [	 
		spec baseline: 'Glamour' with: [ 
			spec repository: 'github://moosetechnology/Glamour/src' ].  	
			
		"For Pharo 6.x continue to load Roassal from SmalltalkHub"
		spec project: 'Roassal2' with: [
			spec
				versionString: #'stable';
				className: #ConfigurationOfRoassal2;
				repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ].
		spec baseline: 'Glamour' with: [ 
			spec repository: 'github://moosetechnology/Glamour:pharo6/src' ].
		spec 
			package: 'PetitParser2-GUI' with: [ 
				spec requires: #('Glamour' 'Roassal2') ].
	].
]
