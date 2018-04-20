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
			package: 'PetitParser2-Validation' with: [ spec requires: #('PetitParser2') ];
			package: 'PetitParser2-Validation-Tests' with: [ spec requires: #('PetitParser2-Validation' 'PetitParser2-Tests') ];

			package: 'PetitParser2-Benchmarks' with: [ spec requires: #('PetitParser2' 'PetitParser2-Validation') ];
			package: 'PetitParser2-Examples' with: [ spec requires: #('PetitParser2' 'PetitParser2-Validation') ];
			package: 'PetitParser2-Tutorial' with: [ spec requires: #('PetitParser2' 'PetitParser2-Validation') ];
			
			"Misc grammars"
			package: 'PetitParser2-Smalltalk' with: [ spec requires: #('PetitParser2' 'PetitParser2-Benchmarks') ];
			package: 'PetitParser2-Smalltalk-Tests' with: [ spec requires: #('PetitParser2-Smalltalk' 'PetitParser2-Tests') ];
			package: 'PetitParser2-Html' with: [ spec requires: #('PetitParser2' 'PetitParser2-Benchmarks') ];
			package: 'PetitParser2-Html-Tests' with: [ spec requires: #('PetitParser2-Html' 'PetitParser2-Tests') ];
			package: 'PetitParser2-CSV' with: [ spec requires: #('PetitParser2') ];
			package: 'PetitParser2-JSON' with: [ spec requires: #('PetitParser2') ];
			package: 'PetitParser2-MSE' with: [ spec requires: #('PetitParser2') ];
			package: 'PetitParser2-ManifestMf' with: [spec requires: #('PetitParser2') ];

			"Experimental packages"
			package: 'PetitParser2-Experiments' with: [ spec requires: #('PetitParser2', 'PetitParser2-Validation' 'PetitParser2-Tests') ].

		spec baseline: 'SmaCC' with: [ 
			spec
				repository: 'github://ThierryGoubier/SmaCC';
				loads: 'Rewrite' ].

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
				
		spec project: 'GToolkit' with: [
				spec
					className: #ConfigurationOfGToolkit;
					versionString: #'stable';
					repository: 'http://www.smalltalkhub.com/mc/Moose/GToolkit/main' ].

		spec 
			package: 'PetitParser2-GUI' with: [ spec requires: #('Glamour' 'Roassal2' 'PetitParser2') ];
			package: 'PetitParser2-GUI-Tests' with: [ spec requires: #('PetitParser2-GUI') ];
			package: 'PetitParser2-Benchmarks-GUI' with: [ spec requires: #('PetitParser2-Benchmarks') ].
			
		spec
			package: 'PetitParser2-RewriteEngine' with: [ spec requires: #('PetitParser2' 'SmaCC') ];
			package: 'PetitParser2-RewriteEngine-Tests' with: [ spec requires: #('PetitParser2-RewriteEngine' 'PetitParser2-Tests') ].
			
		spec group: 'default' with: #('UI').
		spec group: 'Headless' with: #(	
											'PetitParser2' 
											'PetitParser2-Tests' 
											'PetitParser2-Smalltalk' 
											'PetitParser2-Smalltalk-Tests' 
											'PetitParser2-Html' 
											'PetitParser2-Html-Tests' 
											'PetitParser2-Tutorial'
											'PetitParser2-Validation'
											'PetitParser2-Validation-Tests'
											'PetitParser2-Benchmarks'
											).		
													
		spec group: 'UI' with: #( 
											'Headless'
											'PetitParser2-GUI').
	
		spec group: 'Tests' with: #(
											'PetitParser2-Tests'
											'PetitParser2-Smalltalk-Tests' 
											'PetitParser2-Html-Tests' 
											'PetitParser2-Validation-Tests').
		
		spec group: 'RewriteEngine' with: #(
											'PetitParser2-RewriteEngine'
											'PetitParser2-RewriteEngine-Tests').
		
		spec group: 'Experimental' with: #(
											'PetitParser2-Experiments' ).

		spec group: 'Languages' with: #(
											'PetitParser2-Html' 
											'PetitParser2-Html-Tests' 
											'PetitParser2-CSV' 
											'PetitParser2-JSON' 
											'PetitParser2-MSE' 
											'PetitParser2-Smalltalk-Tests' 
											'PetitParser2-ManifestMf' ).

		spec group: 'All' with: #(
											'UI' 
											'Experimental' 
											'Languages'
											'RewriteEngine' ).

	]