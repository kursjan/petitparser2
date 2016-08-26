private
buildSelector: anArray
	^ (String streamContents: [ :stream | anArray do: [ :each | stream nextPutAll: each value ] ]) asSymbol