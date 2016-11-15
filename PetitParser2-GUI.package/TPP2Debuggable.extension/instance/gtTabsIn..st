*PetitParser2-GUI
gtTabsIn: composite

	composite tabulator with: [ :tabulator |
		tabulator column: #one.
		
		tabulator transmit to: #one; andShow: [ :a :b |  
			self gtSampleIn: a result: b.
			self gtTraceIn: a. 
		].
	]