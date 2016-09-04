morphic ui
buildWindow
	self addMorph: textArea fullFrame: (LayoutFrame new topFraction: 0.2).
					
	self addMorph: keyMorph fullFrame: LayoutFrame identity.