drawing
draw
	| datasets |
	grapher := RTGrapher new.
	grapher extent: 500 @ 500.

	"Legend"
	legend := RTLegendBuilder new.
	legend view: grapher view.
	legend addText: 'Time vs Input size'.

	datasets := report groupBy: #name.
	colors := RTMultiLinearColorForIdentity new objects: datasets values.

	datasets do: [:ds | 
		self addPlotData: ds
	].

	legend build.
	grapher build.
	^ grapher view