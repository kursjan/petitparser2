private
charactersDo: aBlock
	1 to: 256 do: [ :index | aBlock value: (Character codePoint: index) ]