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
			package: 'PetitParser2-Benchmarks' with: [ spec requires: #('PetitParser2' 'PetitParser2-Validation') ];
			package: 'PetitParser2-Smalltalk' with: [ spec requires: #('PetitParser2' 'PetitParser2-Benchmarks') ];
			package: 'PetitParser2-Smalltalk-Tests' with: [ spec requires: #('PetitParser2-Smalltalk' 'PetitParser2-Tests');
			package: 'PetitParser2-CSV' with: [ spec requires: #('PetitParser2') ];
			package: 'PetitParser2-JSON' with: [ spec requires: #('PetitParser2') ];
			package: 'PetitParser2-MSE' with: [ spec requires: #('PetitParser2') ] ].

		spec project: 'Glamour' with: [
			spec
				versionString: #'development';
				className: 'ConfigurationOfGlamour';
				repository: 'http://www.smalltalkhub.com/mc/Moose/Glamour/main' ].
			
		spec project: 'Roassal2' with: [
				spec
					versionString: #'development';
					className: #ConfigurationOfRoassal2;
					repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ].
		spec project: 'GToolkit' with: [
				spec
					className: #ConfigurationOfGToolkit;
					versionString: #'development';
					repository: 'http://www.smalltalkhub.com/mc/Moose/GToolkit/main' ].

		spec 
			package: 'PetitParser2-GUI' with: [ spec requires: #('Glamour' 'Roassal2' 'PetitParser2') ];
			package: 'PetitParser2-GUI-Tests' with: [ spec requires: #('PetitParser2-GUI') ];
			package: 'PetitParser2-Benchmarks-GUI' with: [ spec requires: #('PetitParser2-Benchmarks') ].
			
		spec group: 'PetitParser2-Headless' with: #(	
											'PetitParser2' 
											'PetitParser2-Tests' 
											'PetitParser2-Smalltalk' 
											'PetitParser2-Smalltalk-Tests' 
											'PetitParser2-Validation'
											'PetitParser2-Validation-Tests'
											'PetitParser2-Benchmarks'
											).		
													
		spec group: 'PetitParser2-IDE' with: #( 
											'PetitParser2-Headless'
											'PetitParser2-GUI').
	
		spec group: 'Tests' with: #(
											'PetitParser2-Tests'
											'PetitParser2-Smalltalk-Tests' 
											'PetitParser2-Validation-Tests').
	] 