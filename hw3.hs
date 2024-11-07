{-# OPTIONS_GHC -Wno-x-partial -Wno-unrecognised-warning-flags #-}

-- Q1
-- without pattern matching
myremoveduplicates :: (Eq a) => [a] -> [a]
myremoveduplicates list
    | null list = []
    | elem (head list) (tail list) = myremoveduplicates (tail list)
    | otherwise                    = (head list) : myremoveduplicates (tail list)

--with pattern matching
myremoveduplicates_pm :: (Eq a) => [a] -> [a]
myremoveduplicates_pm [] = []
myremoveduplicates_pm (x:xs)
    | elem x xs = myremoveduplicates_pm xs
    | otherwise = x : myremoveduplicates_pm xs

-- Q2
-- without pattern matching
myintersection :: (Eq a) => [a] -> [a] -> [a]
myintersection list1 list2
    | null list1 || null list2 = []
    | elem (head list1) list2 = (head list1) : myintersection (tail list1) list2
    | otherwise               = myintersection (tail list1) list2

-- with pattern matching
myintersection_pm :: (Eq a) => [a] -> [a] -> [a]
myintersection_pm [] _ = []
myintersection_pm (x:xs) list2
    | elem x list2 = x : myintersection_pm xs list2
    | otherwise    = myintersection_pm xs list2

-- Q3
-- without pattern matching
mynthtail :: Int -> [a] -> [a]
mynthtail n list
    | n <= 0 || null list = list
    | otherwise           = mynthtail (n-1) (tail list)

-- with pattern matching
mynthtail_pm :: Int -> [a] -> [a]
mynthtail_pm 0 list = list
mynthtail_pm n list = mynthtail_pm (n-1) (tail list)

-- Q4
-- without pattern matching
mylast :: [a] -> [a]
mylast list
    | null list = []
    | null (tail list) = list
    | otherwise = mylast (tail list)

-- with pattern matching
mylast_pm :: [a] -> [a]
mylast_pm [] = []
mylast_pm [x] = [x]
mylast_pm (x:xs) = mylast_pm xs

-- Q5
-- without pattern matching
myreverse :: [a] -> [a]
myreverse list
    | null list = []
    | otherwise = reverse list

-- with pattern matching
myreverse_pm :: [a] -> [a]
myreverse_pm [] = []
myreverse_pm (x:xs) = reverse (x:xs)

-- Q6
-- without pattern matching
myreplaceall :: (Eq a) => a -> a -> [a] -> [a]
myreplaceall new old list
    | null list = []
    | head list == old = new : myreplaceall new old (tail list)
    | otherwise = head list : myreplaceall new old (tail list)

-- with pattern matching
myreplaceall_pm :: (Eq a) => a -> a -> [a] -> [a]
myreplaceall_pm _ _ [] = []
myreplaceall_pm new old (x:xs)
    | x == old = new : myreplaceall_pm new old xs
    | otherwise = x : myreplaceall_pm new old xs

-- Q7
-- without pattern matching
myordered :: (Ord a) => [a] -> Bool
myordered list
    | null list = True
    | null (tail list) = True
    | head list <= head (tail list) = myordered (tail list)
    | otherwise = False

-- with pattern matching
myordered_pm :: (Ord a) => [a] -> Bool
myordered_pm [] = True
myordered_pm [_] = True
myordered_pm (x:y:xs)
    | x <= y = myordered_pm (y:xs)
    | otherwise = False

-- Q8
computeFees :: String -> Int
computeFees input = 0