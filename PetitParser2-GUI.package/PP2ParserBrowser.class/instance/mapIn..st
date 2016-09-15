private building
mapIn: composite
	self class environment at: #GLMRoassal2Presentation ifPresent: [ :cls |
		composite roassal2
			title: 'Map';
			useExplicitNotNil;
			initializeView: [ RTMondrian new ];
			painting: [ :view :class :selector |
				(self production: #start from: class)
					viewAllNamedParsersWithSelection: (Array with: selector)  
					previewing: [:eachParser | self sourceCodeFrom: class selector: eachParser name ]
					on:  view ] ]	
