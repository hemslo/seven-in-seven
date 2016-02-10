import public Data.Vect

-- Write a type for an m×n matrix.

Matrix : Nat -> Nat -> Type -> Type
Matrix n m a = Vect n (Vect m a)

-- Write a function to mirror a matrix horizontally.

horizontallyMirrorMatrix: Matrix n m a -> Matrix n m a
horizontallyMirrorMatrix [] = []
horizontallyMirrorMatrix (row :: rows) = reverse row :: (horizontallyMirrorMatrix rows)

-- Write a function to transpose the matrix so that element m, n in the argument is element n, m in the result.
transposeMatrix : Matrix n m a -> Matrix m n a
transposeMatrix matrix = transpose matrix
