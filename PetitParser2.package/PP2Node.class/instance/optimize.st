optimizations
optimize
	PP2SpecializingVisitor new doPass: self.

	PP2ParentAnalysisVisitor new doPass: self.
	PP2RecognizerVisitor new doPass: self.
		
	PP2FirstSetAnalysis new doPass: self.
	PP2GuardVisitor new doPass: self.
