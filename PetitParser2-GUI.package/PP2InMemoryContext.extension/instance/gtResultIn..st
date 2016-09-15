*PetitParser2-GUI
gtResultIn: composite
	<gtInspectorPresentationOrder: 20>
	
	composite text
		title: 'Result';
		display: [ :ctx |  ctx retval ];
		act: [ :p :ctx | ctx retval inspect ] icon: GLMUIThemeExtraIcons glamorousInspect entitled: 'Inspect';
		act: [ :p :ctx | ctx retval explore ] icon: GLMUIThemeExtraIcons glamorousSearch entitled: 'Explore'.

