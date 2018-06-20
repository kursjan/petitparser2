baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'PetitParser2Core'.
		spec repository: 'github://kursjan/petitparser2:master'.
		spec 
			package: 'PetitParser2';
			package: 'PetitParser2-Tests' with: [ 
				spec requires: #('PetitParser2') ];
			package: 'PetitParser2-Validation' with: [ 
				spec requires: #('PetitParser2') ];
			package: 'PetitParser2-Validation-Tests' with: [ 
				spec requires: #('PetitParser2-Validation' 'PetitParser2-Tests') ];

			package: 'PetitParser2-Benchmarks' with: [ 
				spec requires: #('PetitParser2' 'PetitParser2-Validation') ];
			package: 'PetitParser2-Tutorial' with: [ 
				spec requires: #('PetitParser2' 'PetitParser2-Validation') ] ]