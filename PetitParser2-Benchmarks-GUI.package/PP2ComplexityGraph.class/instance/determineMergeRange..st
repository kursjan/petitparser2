drawing
determineMergeRange: ds
	^ ((ds collect: #size) max // 100) max: 1