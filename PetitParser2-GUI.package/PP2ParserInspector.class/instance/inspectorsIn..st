private building
inspectorsIn: composite
	composite dynamic 
		display: [ :context :parser |
			GLMCompositePresentation new with: [ :aComposite | 
				context gtResultIn: aComposite.
				context gtEventsIn: aComposite.
				context gtReport: aComposite.
				context gtTallyIn: aComposite.
				context gtTreeViewIn: aComposite.
				self  	  gtWarningsIn: aComposite for: parser.
			].
		].