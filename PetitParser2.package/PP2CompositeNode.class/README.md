A PPCompositeParser is composed parser built from various primitive parsers. 

Every production in the receiver is specified as a method that returns its parser. Note that every production requires an instance variable of the same name, otherwise the production is not cached and cannot be used in recursive grammars. Productions should refer to each other by reading the respective inst-var. Note: these inst-vars are typically not written, as the assignment happens in the initialize method using reflection.

The start production is defined in the method start. It is aliased to the inst-var parser defined in the superclass of PPCompositeParser.