private
menuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: self label)
		parent: #Tools;
		icon: self icon;
		action: [ self open ]