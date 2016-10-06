I collect all the children that has a name. I do not collect children of those children. For that, you can simply use:

#allNodes select: [:n | n name isNil not ]