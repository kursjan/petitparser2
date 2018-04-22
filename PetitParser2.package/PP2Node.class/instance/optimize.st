optimizations
optimize
	self isOptimized ifTrue: [ ^ self ].
	
	PP2SeaOptimizationVisitor new doPass: self.
	
	PP2SpecializingVisitor new doPass: self.

	PP2RecognizerVisitor new doPass: self.

	"
		Pre-compute isNullable and firstSet properties
	"
	PP2IsNullableCache new doPass: self.
	PP2FirstSetCache new doPass: self.

	"
		Should be called before CommonPrefix. Both do caching, but trimming is tailored to the
		whitespace handling in PP2 and has more suitable cache.
	"
	PP2TrimmingCacheVisitor new doPass: self.

	"Use packrat parsing"
	PP2PackratVisitor new doPass: self.

	"Cache the intermediate results for the Guard and Common Prefix visitors"
	PP2AllNodesCache new doPass: self.
	PP2FirstProductionSetCache new doPass: self.
	PP2CommonPrefixVisitor new doPass: self.
	
	PP2GuardVisitor new doPass: self.
	
	PP2BypassVisitor new doPass: self.
	
	"
		TODO(JanKurs): hack to inject reparsable visitor from experiments.
	"
	(Smalltalk at: #PP2ReparsableVisitor ifAbsent: nil) ifNotNil: [ :reparsableVisitor |
		reparsableVisitor new doPass: self.
	].
	
	"Inject CF memoizations when possible"
	PP2ContextChangesCache new doPass: self.
	PP2ContextSensitivityCache new doPass: self.
	PP2ContextMemoizationVisitor new doPass: self.
	
	self propertyAt: #allCaches put: self collectCaches.
	self setOptimized.