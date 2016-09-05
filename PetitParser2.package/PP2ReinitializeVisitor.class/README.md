I call #initializeFor: on all the node strategies.

The reason is, when a  node is created it is incomplete and some information (for example its children) might be missin. The strategy then is missing this information as well, because it was created in a time the node was incomplte.