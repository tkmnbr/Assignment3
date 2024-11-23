import Distribution.SPDX (LicenseId(LAL_1_2))

import Distribution.SPDX (LicenseId(LAL_1_2))
myzip::[a] -> [b] -> [(a,b)]
myzip l1 l2
    | null l1 || null l2 = []
    | otherwise = (head l1, head l2) : myzip (tail l1) (tail l2)


main :: IO ()
main = do
    -- Test cases
    let list1 = [1, 2, 3]
    let list2 = ['a', 'b', 'c']
    let list3 = [1, 2]
    let list4 = ['x', 'y', 'z']

    -- Print results of myzip
    print (myzip list1 list2)  -- Output: [(1,'a'), (2,'b'), (3,'c')]
    print (myzip list1 list4)  -- Output: [(1,'x'), (2,'y')]
    print (myzip list3 list2)  -- Output: [(1,'a'), (2,'b')]