accessing
interval
"	
	(start isNil not and: [stop isNil not]) ifTrue: [ 
		^ (start to: stop)
	].
"
	^ 1 to: entries size.