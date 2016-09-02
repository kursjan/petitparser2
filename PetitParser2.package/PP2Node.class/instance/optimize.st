optimizations
optimize
	self isOptimized ifTrue: [ ^ self ].
	
	PP2SpecializingVisitor new doPass: self.

	PP2ParentAnalysisVisitor new doPass: self.
	PP2RecognizerVisitor new doPass: self.

	PP2AcceptsEpsilonCache new doPass: self.
	PP2FirstSetCache new doPass: self.

	PP2ChoiceGuardVisitor new doPass: self.
	 "
		Should be called before CommonPrefix. Both do caching, but trimming is tailored to the
		whitespace handling in PP2 and has more suitable cache.
	"
	PP2TrimmingGuardVisitor new doPass: self.
	PP2CommonPrefixVisitor new doPass: self.
	
	PP2BypassDelegatesVisitor new doPass: self.
	self setOptimized.