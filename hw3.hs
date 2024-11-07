-- Q1
-- without pattern matching
myremoveduplicates :: (Eq a) => [a] -> [a]
myremoveduplicates list
    | null list = []
    | elem (head list) (tail list) = myremoveduplicates (tail list)
    | otherwise                    = (head list) : myremoveduplicates (tail list)

--with pattern matching
myremoveduplicates_pm :: (Eq a) => [a] -> [a]
myremoveduplicates_pm list [] = []
myremoveduplicates_pm (x:xs)
    | elem x xs = myremoveduplicates_pm xs
    | x : myremoveduplicates_pm xs

-- Q2
-- without pattern matching
