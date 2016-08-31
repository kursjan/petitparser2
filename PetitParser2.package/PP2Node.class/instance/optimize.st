optimizations
optimize
	PP2SpecializingVisitor new doPass: self.

	PP2ParentAnalysisVisitor new doPass: self.
	PP2RecognizerVisitor new doPass: self.

	PP2AcceptsEpsilonCache new doPass: self.
	PP2FirstSetCache new doPass: self.
	PP2ChoiceGuardVisitor new doPass: self.
