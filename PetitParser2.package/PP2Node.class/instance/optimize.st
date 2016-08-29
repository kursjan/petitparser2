optimizations
optimize
	PP2ParentAnalysisVisitor new visit:self.
	PP2SpecializingVisitor new visit: self.
	PP2RecognizerVisitor 	new visit: self.
