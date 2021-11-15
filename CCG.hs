-- defining data type
data DataType = Entity String | Bool Int | RightF DataType DataType | LeftF DataType DataType deriving (Eq, Show)

-- define combinators 
application :: DataType -> DataType -> Maybe DataType
application (RightF a b) entity = if b==entity then Just a else Nothing
application entity (LeftF a b) = if b==entity then Just a else Nothing
application _ _ = Nothing

composition :: DataType -> DataType -> Maybe DataType
composition (RightF a b) (RightF c d) = if b==c then Just (RightF a d) else Nothing
composition (LeftF a b) (LeftF c d) = if a==d then Just (LeftF c b) else Nothing
composition _ _ = Nothing

substitution :: DataType -> DataType -> Maybe DataType
substitution (RightF (RightF a b) c) (RightF d e) = if b==d && c==e then Just (RightF a e) else Nothing
substitution (LeftF (RightF a b) c) (LeftF d e) = if b==d && c==e then Just (LeftF a e) else Nothing
substitution (LeftF a b) (LeftF (LeftF c d) e) = if a==d && b==e then Just (LeftF c e) else Nothing
substitution (RightF a b) (RightF (LeftF c d) e) = if a==d && b==e then Just (RightF c e) else Nothing
substitution _ _ = Nothing

type_rising :: DataType -> DataType -> String ->Maybe DataType
type_rising a b "right" = Just (RightF b (LeftF b a))
type_rising a b "left"  = Just (LeftF b (RightF b a))
type_rising _ _ _ = Nothing

a = Entity "a"
b = Entity "b"
c = Entity "c"
r1 = RightF a b
r2 = RightF b c
r3 = RightF r1 c
l1 = LeftF a b
l2 = LeftF c a