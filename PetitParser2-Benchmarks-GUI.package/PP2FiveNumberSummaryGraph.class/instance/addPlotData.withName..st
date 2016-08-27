adding
addPlotData: ds withName: name
	| rtData summary |
	"To avoid too many crosses nearby, group by hundreds:"
	summary := report fiveNumberSummary: (self extractBlock value: ds).

	rtData := RTBoxPlotDataSet new.
	rtData points: summary.
	rtData model: name.
		
	"rtData boxShape color: (colors rtValue: name)."
	rtData boxLineShape color: (colors rtValue: name).

	grapher add: rtData.
	legend addColor: (colors rtValue: name) text: name.
	