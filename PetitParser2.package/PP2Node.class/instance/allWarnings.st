optimizations - warnings
allWarnings
	| warnings |
	warnings := Dictionary new.
	self allNodesDo: [ :node | 
		node warnings do: [ :w | warnings at: node put: w ]
	].
	^ warnings