# Enhance the XML program to add spaces to show the indentation structure.
# Enhance the XML program to handle attributes: if the first argument is a map (use the curly brackets syntax), add attributes to the XML program. For example:
# book({"author": "Tate"}...) would print <book author="Tate">:

OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doMessage(arg)
       )
  r
)
Map atPutNumber := method(
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
       call evalArgAt(1))
)

Builder := Object clone
Builder indent := 0
Builder forward := method(
  write("  " repeated(indent), "<", call message name)
  firstArg := call message arguments first
  if(firstArg != nil and firstArg name == "curlyBrackets",
     attrs := doMessage(firstArg)
     if(attrs type == "Map", attrs foreach(k, v, write(" ", k, "=\"", v, "\"")))
     )
  writeln(">")
  indent = indent + 1
  call message arguments foreach(
  arg,
  content := self doMessage(arg);
  if(content type == "Sequence", writeln("  " repeated(indent), content)))
  indent = indent - 1
  writeln("  " repeated(indent), "</", call message name, ">")
)

doString("Builder book({\"author\":\"Tate\"}, ul(li(\"Io\"), li(\"Lua\"), li(\"JavaScript\")))")

# Create a list syntax that uses brackets.
squareBrackets := method(call message arguments)
l := [1, 2, 3]
l println
