baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'PetitParser2'.
		spec repository: 'github://kursjan/petitparser2:master'.
		spec baseline: 'PetitParser2' with: [ 
			spec repository: 'github://kursjan/petitparser2:master' ].

		spec
			"Experimental packages"
			package: 'PetitParser2-Experiments' with: [ 
				spec requires: #('PetitParser2') ].
	]