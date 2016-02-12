-- Write the signature of a function, typeNamed, that will take the name of a type and return that type. For example, typeNamed "Int" would return the type Int.
-- Implement your typeNamed function for a few different types.
-- Add the keyword total to the beginning of your typeNamed function signature from the Easy section—that is, total typeNamed : .... Reload your file, and see that your function is not total (defined for all inputs). Make your function total by giving it behavior for bad inputs such as "ThisIsNotAType".

total typeNamed : String -> Type
typeNamed "String" = String
typeNamed "Int" = Int
typeNamed _ = String
