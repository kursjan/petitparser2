setup & teardown
setupInputs: selector steps: steps amount: amount max: max
	| size step |
	input := OrderedCollection new.
	step := max // steps.
	
	1 to: steps do: [ :index |
		size := step * index.
		amount timesRepeat: [ 
			input add: (PPCResources current perform: selector with: size).
		]
	].