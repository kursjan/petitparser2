transforming
transform
	self performComponentRefactoring: (RBAddClassRefactoring
		model: self model
		addClass: name
		superclass: superclass
		subclasses: #()
		category: cateogry).
	(self classObjectFor: name)
		compile: self startProductionSource
		classified: #(accessing)