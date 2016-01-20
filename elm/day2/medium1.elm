-- Write a program that counts up, from zero, with one count per second.
import Graphics.Element exposing (show)
import Signal
import Time

count signal = Signal.foldp (\_ n -> n + 1) 0 signal
main = Signal.map show (count (Time.every Time.second))
