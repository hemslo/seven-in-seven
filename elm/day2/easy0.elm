-- Write a signal to display the current mouse position, including whether a mouse button is pressed.
import Graphics.Element exposing (show)
import Mouse
showAll x y = show (x, y)
main = Signal.map2 (showAll) Mouse.position Mouse.isDown
