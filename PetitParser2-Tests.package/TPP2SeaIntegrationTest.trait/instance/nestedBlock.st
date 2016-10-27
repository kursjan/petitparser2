parse support
nestedBlock
	| blockSea block nilIsland |
	blockSea := self seaInstance.
	nilIsland := (self emptySea ==> #first).
	
	block := PP2DelegateNode new.
	block child: (${ asPParser,  (blockSea plus / nilIsland), $} asPParser).
	block name: 'block'.
	
	blockSea island: block.
	blockSea name: 'block island'.
	^ block