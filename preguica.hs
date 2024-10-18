
data TruthValue = Meio | Um | Zero

instance (Show TruthValue) where
    show Meio = "\\meio{}"
    show Um = "1"
    show Zero = "0"

instance (Eq TruthValue) where
    Zero == Zero = True
    Zero == _ = False

    Um == Um = True
    Um == _ = False

    Meio == Meio = True
    Meio == _ = False

instance (Ord TruthValue) where
    Zero <= _ = True

    Meio <= Zero = False
    Meio <= _ = True

    Um <= Um = True
    Um <= _ = False


neg Meio = Meio
neg Zero = Um
neg Um = Zero

con Meio = Zero
con Um = Um
con Zero = Um

circ Meio = Zero
circ Um = Um
circ Zero = Zero

to a b = max (neg a) b

land a b = min a b

lor a b = max a b


phi (alpha) =  alpha `lor` neg alpha
vars = [(i) | i <- [Um, Meio, Zero]]

result = map phi vars

main = 
    do
       sequence $ map print vars
       sequence $ map print result
