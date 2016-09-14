*PetitParser2-GUI
gtAcceptedChars: composite
	<gtInspectorPresentationOrder: 50>
	
	composite list 
		title: 'Accepted Chars (preview)';
		display: [ :e | 
			| chars |
			chars := OrderedCollection new.
			32 to: 128 do: [ :index | (e value: (Character codePoint: index)) ifTrue: [ 
					chars add: (Character codePoint: index) ] ].
			chars
	]