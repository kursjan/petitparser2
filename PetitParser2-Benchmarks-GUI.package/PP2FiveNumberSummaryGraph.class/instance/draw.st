drawing
draw
	| datasets |
	grapher := RTGrapher new.
"	grapher extent: 300 @ 300."

	"Legend"
	legend := RTLegendBuilder new.
	legend view: grapher view.
	legend addText: self title.

	datasets := report groupBy: #name.
	colors := RTMultiLinearColorForIdentity new objects: datasets keys.

	datasets keysAndValuesDo: [:name :data | 
		self addPlotData: data withName: name
	].

	grapher axisX 
		labelRotation: -30;
		labelConversion: [ :v | datasets keys at: v ifAbsent: '' ];
		numberOfTicks: (datasets keys size + 1);
		numberOfLabels: datasets keys size.
	grapher title: 'foo'.
"	legend build."
	grapher build.
	^ grapher view