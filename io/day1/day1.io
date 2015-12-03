# Run an Io program from a file.
# io day1.io

# Execute the code in a slot given its name.
Car := Object clone
Car drive := method("Vroom" println)
Car getSlot("drive") call
