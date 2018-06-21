baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'PetitParser2'.
		spec repository: 'github://kursjan/petitparser2:master'.
		spec baseline: 'PetitParser2Core' with: [ 
			spec repository: 'github://kursjan/petitparser2:master' ].
		spec baseline: 'PetitParser2Languages' with: [ 
			spec repository: 'github://kursjan/petitparser2:master' ].
	]