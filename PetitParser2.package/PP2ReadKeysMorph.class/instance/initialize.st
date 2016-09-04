initialization
initialize
	| infoLabel infoLabel2 |
	super initialize.
	
	infoLabel := LabelMorph newLabel: 'Click on me and check the Transcript. Try to type "petit"'.
	self addMorph: infoLabel fullFrame: LayoutFrame identity.

	keyStream := PP2AsyncSteam new.