*PetitParser2-GUI
gtWarnings: composite
	<gtInspectorPresentationOrder: 50>
	| warnings |
	warnings := 	self allWarnings.
	warnings isEmpty ifFalse: [ 
		composite table
			title: 'Optimization Warnings';
			column: 'Node' evaluated: [ :each | each key printString ];
			column: 'Warning' evaluated: [ :each | each value printString ];
			display: [ :node | node allWarnings associations ]
	]