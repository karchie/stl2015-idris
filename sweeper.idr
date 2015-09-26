module Minesweeper

import Data.Vect
import Data.Fin

data BoardCell = Mine | Near Nat

mineLocType : Nat -> Nat -> Type
mineLocType rows cols = (Fin rows, Fin cols)

boardType : Nat -> Nat -> Type
boardType rows cols = Vect rows (Vect cols BoardCell)

emptyBoard : (rows: Nat) -> (cols: Nat) -> (boardType rows cols)
emptyBoard rows cols = replicate rows (replicate cols (Near 0))

addMine : (boardType rows cols) -> (mineLocType rows cols) -> (boardType rows cols)
addMine board (r, c) = ?doAddOneMine

makeBoard : (rows: Nat) -> (cols: Nat) -> List (mineLocType rows cols) -> (boardType rows cols)
makeBoard rows cols = foldl addMine (emptyBoard rows cols)
