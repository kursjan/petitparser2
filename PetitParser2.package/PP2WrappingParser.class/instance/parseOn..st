parsing - private
parseOn: aPPContext
	^ block value: aPPContext value: [ parser parseWithContext:  aPPContext ]