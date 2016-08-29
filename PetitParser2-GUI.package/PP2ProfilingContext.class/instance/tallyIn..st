gt
tallyIn: composite
	<gtInspectorPresentationOrder: 35>

	composite table 
		title: 'Global Tally';
		column: 'Selector/Parser' evaluated: [ :each | each first printString ];
		column: 'Count' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [ self asFrequencyTable ];
		noSelection;
		showOnly: 50