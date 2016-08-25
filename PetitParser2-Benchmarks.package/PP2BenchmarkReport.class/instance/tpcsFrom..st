summary
tpcsFrom: subentries
	| size |
	size := (self sizesFrom: subentries) anyOne.
	^ (subentries collect: #time) collect: [ :e | e / size * 1000 ]