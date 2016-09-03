parsing - private
parseOn: aPPContext
	^ block value: aPPContext value: [ child parseWithContext:  aPPContext ]