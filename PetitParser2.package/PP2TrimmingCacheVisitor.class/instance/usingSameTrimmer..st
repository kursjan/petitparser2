optimizations
usingSameTrimmer: node
	| trimmings trimmers |
	trimmings := node allNodes select: [ :c | c isTrimming ].
	
	trimmers := trimmings collect: [ :e | e trimmer ].

	^ (Set withAll: trimmers) size = 1