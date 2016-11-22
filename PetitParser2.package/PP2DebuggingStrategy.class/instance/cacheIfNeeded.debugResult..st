caching
cacheIfNeeded: result debugResult: debugResult
	
	(strategy includesCache and: [ (resultCache includesKey: result) and: [ (debugResult allResults size = 1 )]]) ifTrue:[
		debugResult children add: (PP2DebugResultLink on: (resultCache at: result))
	] ifFalse: [ 
		resultCache at: result put: debugResult.
	]