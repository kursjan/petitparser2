summary
timesWithoutGCFrom: subentries
	^ subentries collect: [:e | e time - e gcTime ]