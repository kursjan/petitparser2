parse support
emptySea
	| nilSea |
	nilSea := self seaInstance.
	nilSea island: nil asPParser.
	nilSea name: 'nil sea'.
	^ nilSea