building
buildBrowser
	"self openOn: PPArithmeticParser"
	| browser |
	
	browser := GLMTabulator new.
	browser title: [:each | each name].
	browser 
		row: [:r | r column: #productions ; column: #workspace span: 2];
		row: #inspector.
	browser transmit to: #productions; andShow: [:a | 
	 	self productionsIn: a ]. 
	browser transmit to: #workspace; fromOutsidePort: #entity; from: #productions; andShow: [:a | 
		self workspaceIn: a ]. 
	browser transmit to: #inspector; fromOutsidePort: #entity; from: #productions; passivelyFrom: #outer port: #sampleText; andShow: [:a |
		self inspectorIn: a ].
	browser transmit from: #inspector port: #sampleText; toOutsidePort: #sampleText; when: [:arg | arg notNil ].

	browser transmit from: #workspace; toOutsidePort: #productionToSelect; 
		transformed: [:parser | parser name ];
		when: [:parser | parser name notNil ].
	browser transmit fromOutsidePort: #productionToSelect; to: #productions port: #selection.
	^ browser