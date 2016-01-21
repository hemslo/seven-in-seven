-- Use foldp to make the car move from left to right, and then right to left, across the bottom of the screen.
-- Make the car move faster when the mouse is farther to the right, and slower when the mouse is farther to the left.

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Signal exposing (foldp, map, sampleOn)
import Mouse
import Window
import Time exposing (Time, fps, inSeconds)

carBottom = filled black (rect 160 50)
carTop = filled black (rect 100 60)
tire = filled red (circle 24)

type alias Input = { w:Int, x:Int, delta:Time }
type alias Car = { x:Float, forward:Bool, vx:Float}

secsPerFrame = 1.0 / 50.0
delta = Signal.map inSeconds (fps 50)
input = sampleOn delta (Signal.map3 Input Window.width Mouse.x delta)

defaultCar = {x=300.0, forward=True, vx=1.0}

step input ({x, forward, vx} as car) =
   let forward' = if (car.x > ((input.w * 2) - 150)) || (car.x < 150)
                  then not (car.forward)
                  else car.forward
       vx' = 50 + toFloat input.x / 100.0
       distance = vx' * secsPerFrame
   in { car | x = x + if forward' then distance else -distance, forward = forward', vx = vx' }

display car =
  collage (car.x) 300
  [ carBottom
  , carTop |> moveY 30
  , tire |> move (-40, -28)
  , tire |> move (40, -28)
  ]

main = map display (foldp step defaultCar input)
