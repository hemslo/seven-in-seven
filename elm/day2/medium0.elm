-- Use map and signals to draw your own picture at the current mouse position. Change the picture when a mouse button is pressed.
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse
import Window

carTop = filled black (rect 100 60)
tire = filled red (circle 24)

display (w, h) (x, y) isDown = collage w h
    [
      (if isDown then carTop else tire)
        |> moveX (toFloat x - toFloat w / 2)
        |> moveY (toFloat h / 2 - toFloat y)
    ]

main = Signal.map3 (display) Window.dimensions Mouse.position Mouse.isDown
