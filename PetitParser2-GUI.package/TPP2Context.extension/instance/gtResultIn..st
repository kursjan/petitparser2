*PetitParser2-GUI
gtResultIn: composite
	<gtInspectorPresentationOrder: 20>
	
	composite text
		title: 'Result';
		display: [ :ctx |  ctx returnValue ];
		act: [ :p :ctx | ctx returnValue inspect ] icon: GLMUIThemeExtraIcons glamorousInspect entitled: 'Inspect';
		act: [ :p :ctx | ctx returnValue explore ] icon: GLMUIThemeExtraIcons glamorousSearch entitled: 'Explore'.

