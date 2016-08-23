baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'PetitParser2'.
		spec repository: 'github://kursjan/petitparser2:master'.
		spec 
			package: 'PetitParser2';
			package: 'PetitParser2-Tests' with: [ spec requires: #('PetitParser2') ];
			package: 'PetitParser2-Backtracking' with: [ spec requires: #('PetitParser2') ];
			package: 'PetitParser2-Backtracking-Tests' with: [ spec requires: #('PetitParser2-Validation' 'PetitParser2-Tests') ];
			package: 'PetitParser2-Validation' with: [ spec requires: #('PetitParser2') ];
			package: 'PetitParser2-Validation-Tests' with: [ spec requires: #('PetitParser2-Validation' 'PetitParser2-Tests') ];
			package: 'PetitParser2-Compatibility' with: [ spec requires: #('PetitParser' 'PetitParser2' 'PetitParser2-Validation') ];
			package: 'PetitParser2-Compatibility-Tests' with: [ spec requires: #('PetitParser2-Validation-Tests') ];

			project: 'PetitParser' with: [
				spec
					className: 'ConfigurationOfPetitParser';
					file: 'ConfigurationOfPetitParser';
					version: #stable;
					loads: #(#'Parser');
					repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ].

		spec group: 'Core' with: #('PetitParser2' 'PetitParser2-Tests').
		spec group: 'Backtracking' with: #('PetitParser2-Backtracking' 'PetitParser2-Backtracking-Tests').
		spec group: 'Compatibility' with: #('PetitParser2-Compatibility' 'PetitParser2-Compatibility-Tests').
		spec group: 'All' with: #(	'PetitParser2' 
											'PetitParser2-Tests' 
											'PetitParser2-Backtracking' 
											'PetitParser2-Backtracking-Tests'
											'PetitParser2-Validation' 
											'PetitParser2-Validation-Tests' 
											'PetitParser2-Compatibility' 
											'PetitParser2-Compatibility-Tests').
	].

	spec for: #('squeakCommon')  do: [
		spec project: 'Glamour' with: [
			spec
				className: 'ConfigurationOfGlamour';
				file: 'ConfigurationOfGlamour';
				version: #development;
				repository: 'http://www.smalltalkhub.com/mc/Moose/Glamour/main' ].
		spec 
			package: 'PetitParser2-GUI' with: [ spec requires: #('Glamour' 'PetitParser2')].
		
		spec group: 'IDE' with: #( 'PetitParser2-GUI' ) 
	] 