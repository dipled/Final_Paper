
data TruthValue = Zero | Half | Unit deriving (Eq, Ord)

instance Show TruthValue where
    show Half = "\\meio{}"
    show Unit = "1"
    show Zero = "0"

neg :: TruthValue -> TruthValue
neg Half = Half
neg Zero = Unit
neg Unit = Zero

circ :: TruthValue -> TruthValue
circ Half = Zero
circ Unit = Unit
circ Zero = Unit

to :: TruthValue -> TruthValue -> TruthValue
to a b = max (neg a) b

land :: TruthValue -> TruthValue -> TruthValue
land a b = min a b

lor :: TruthValue -> TruthValue -> TruthValue
lor a b = max a b

phi :: (TruthValue, TruthValue) -> TruthValue
phi (alpha,beta) = (neg (alpha `to` beta)) `to` (alpha `land` (neg beta))

vars :: [(TruthValue, TruthValue)]
vars = [(i,j) | i <- [Zero, Half, Unit], j <- [Zero, Half, Unit]]

result :: [TruthValue]
result = map phi vars

main :: IO [()]
main = 
    do
       sequence $ map print vars
       sequence $ map print result
