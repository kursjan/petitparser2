building
compose
	"self openOn: PPArithmeticParser"
	self title: [:each | each name].
	self tabulator with: [ :tabulator |
		tabulator 
			row: [:r | r column: #productions ; column: #workspace span: 2];
			row: #inspector.
		tabulator transmit to: #productions; andShow: [:a | 
		 	self productionsIn: a ]. 
		tabulator transmit to: #workspace; fromOutsidePort: #entity; from: #productions; andShow: [:a | 
			self workspaceIn: a ]. 
		tabulator transmit to: #inspector; fromOutsidePort: #entity; from: #productions; passivelyFrom: #outer port: #sampleText; andShow: [:a |
			self inspectorIn: a ].
		tabulator transmit from: #inspector port: #sampleText; toOutsidePort: #sampleText; when: [:arg | arg notNil ].

		tabulator transmit from: #workspace; toOutsidePort: #productionToSelect; 
			transformed: [:parser | parser name ];
			when: [:parser | parser name notNil ].
		tabulator transmit fromOutsidePort: #productionToSelect; to: #productions port: #selection ]