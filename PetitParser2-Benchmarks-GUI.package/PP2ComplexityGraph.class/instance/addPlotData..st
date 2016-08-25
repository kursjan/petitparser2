adding
addPlotData: ds
	| rtData grouped mergeRange |
	"To avoid too many crosses nearby, group by hundreds:"
	mergeRange := self determineMergeRange: ds.
	grouped := ds groupedBy: [:e | (e size // mergeRange) * mergeRange ].
	grouped := grouped collect: [ :e | (e collect: #time) average ].

	rtData := RTData new.
	rtData dotShape 
		cross 
		color: (colors rtValue: ds).

	rtData points: grouped associations.
	rtData x: [:point | point key ].
	rtData y: [:point | point value ].
	grapher add: rtData.

	legend addColor: (colors rtValue: ds) text: ds anyOne name.
	