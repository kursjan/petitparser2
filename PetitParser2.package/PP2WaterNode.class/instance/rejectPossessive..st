private
rejectPossessive: node
	^ node selfSkipDelegate isRepeating ifTrue: [ node child  ] ifFalse: [ node ]