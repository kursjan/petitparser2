"
Baseline with languages: Smalltalk, HTML, SCV, JSON, MSE, Manifest, ...
"
Class {
	#name : #BaselineOfPetitParser2Languages,
	#superclass : #BaselineOf,
	#category : #BaselineOfPetitParser2Languages
}

{ #category : #baselines }
BaselineOfPetitParser2Languages >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'PetitParser2Languages'.
		spec baseline: 'PetitParser2Core' with: [ 
			spec repository: 'github://kursjan/petitparser2:master' ].

		spec
			"Misc grammars"
			package: 'PetitParser2-Smalltalk' with: [ 
				spec requires: #('PetitParser2Core') ];
			package: 'PetitParser2-Smalltalk-Tests' with: [ 
				spec requires: #('PetitParser2-Smalltalk') ];
			package: 'PetitParser2-Html' with: [ 
				spec requires: #('PetitParser2Core') ];
			package: 'PetitParser2-Html-Tests' with: [ 
				spec requires: #('PetitParser2-Html') ];
			package: 'PetitParser2-CSV' with: [ spec requires: #('PetitParser2Core') ];
			package: 'PetitParser2-JSON' with: [ spec requires: #('PetitParser2Core') ];
			package: 'PetitParser2-MSE' with: [ spec requires: #('PetitParser2Core') ];
			package: 'PetitParser2-ManifestMf' with: [ spec requires: #('PetitParser2Core') ];
			package: 'PetitParser2-PEG' with: [ spec requires: #('PetitParser2Core') ];
			
			package: 'PetitParser2-Tutorial' with: [ 
				spec requires: #('PetitParser2Core' 'PetitParser2-Html' 'PetitParser2-Smalltalk') ]
	]
]
