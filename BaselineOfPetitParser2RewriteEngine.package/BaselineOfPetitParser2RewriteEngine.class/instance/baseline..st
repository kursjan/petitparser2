baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'PetitParser2RewriteEngine'.
		spec repository: 'github://feenkcom/petitparser2:master'.
		spec baseline: 'PetitParser2Core' with: [ 
			spec repository: 'github://feenkcom/petitparser2:master' ].

		spec baseline: 'SmaCC' with: [ 
			spec
				repository: 'github://ThierryGoubier/SmaCC';
				loads: 'Rewrite' ].
			
		spec
			package: 'PetitParser2-RewriteEngine' with: [ 
				spec requires: #('PetitParser2Core' 'SmaCC') ];
			package: 'PetitParser2-RewriteEngine-Tests' with: [ 
				spec requires: #('PetitParser2-RewriteEngine') ]
	]