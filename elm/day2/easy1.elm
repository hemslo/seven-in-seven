-- Write a signal to display the y value of the mouse when the button is pressed.
import Graphics.Element exposing (show)
import Mouse
pressY = Signal.sampleOn Mouse.isDown Mouse.y
main = Signal.map show pressY
