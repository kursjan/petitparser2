*PetitParser2-GUI
gtRememberTallyIn: composite
	<gtInspectorPresentationOrder: 34>

	composite table 
		title: 'Remember Tally';
		column: 'Selector/Parser' evaluated: [ :each | each first printString ];
		column: 'Count' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [ self asFrequencyTableForEvent: #remember ];
"		noSelection;"
		showOnly: 50