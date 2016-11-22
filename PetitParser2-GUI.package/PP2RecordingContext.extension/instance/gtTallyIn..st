*PetitParser2-GUI
gtTallyIn: composite
	<gtInspectorPresentationOrder: 35>
	composite table 
		title: 'Global Tally';
		column: 'Strategy' evaluated: [ :each | each first displayName ];
		column: 'Count' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [ self asFrequencyTable ];
		selectionAct: [ :list :context | list selection first inspect] on: $i entitled: 'Inspect (i)';
		act: [ :p :ctx | ctx asFrequencyTable inspect ] icon: GLMUIThemeExtraIcons glamorousInspect entitled: 'Inspect';
		showOnly: 50