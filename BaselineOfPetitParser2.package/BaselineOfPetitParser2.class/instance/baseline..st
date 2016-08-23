baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'PetitParser2'.
		spec repository: 'github://kursjan/petitparser2:master'.
		spec 
			package: 'PetitParser2';
			package: 'PetitParser2-Tests' with: [ spec requires: #('PetitParser2') ].

		spec group: 'Core' with: #('PetitParser2').
		spec group: 'Tests' with: #('PetitParser2-Tests').
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