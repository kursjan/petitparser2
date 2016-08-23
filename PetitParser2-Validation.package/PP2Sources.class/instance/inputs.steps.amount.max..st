utility
inputs: selector steps: steps amount: amount max: max
	| input size step |
	input := OrderedCollection new.
	step := max // steps.
	
	1 to: steps do: [ :index |
		size := step * index.
		amount timesRepeat: [ 
			input add: (self perform: selector with: size).
		]
	].

	^ input