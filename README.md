# Page Menu

Adds a page class select menu to the Pages index.

Each page that you add will call `new_with_defaults` of the 
given page class (if it is a valid descendant of Page) 
which allows you to create default page fields, parts, data,
etc. based upon the class name.