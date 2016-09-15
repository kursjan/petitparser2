private building
inspectorIn: composite
	composite dynamic
		allowNil;
		display: [ :class :productionSelector :sampleText | 
					| wrapperBrowser |
					wrapperBrowser := GLMTabulator new.
					wrapperBrowser allowNil.
					wrapperBrowser column: #wrapped.
					wrapperBrowser transmit
						to: #wrapped;
						andShow: [ :a | a custom: (PP2ParserInspector new noTitle) ].

					wrapperBrowser transmit
						from: #wrapped port: #sampleText;
						toOutsidePort: #sampleText.
						
					wrapperBrowser transmit
						fromOutsidePort: #sampleText;
						to: #wrapped port: #sampleText.

					wrapperBrowser startOn: ([(self production: productionSelector from: class) end] on: Error do: [:e | nil]) .
					(wrapperBrowser pane port: #sampleText) value: (sampleText ifNil: [ '' ] ifNotNil: [ sampleText ]).
					wrapperBrowser
					]

				