accessing
invokedMethods
	| methods |
	methods := OrderedCollection new.
	events withIndexDo: [ :event :index | 
		(event == #methodInvoked) ifTrue: [ 
			methods add: (selectors at: index)
		]
	].
	^ methods