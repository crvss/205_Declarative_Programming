{- 
Group 65
Tom Cresswell 1903451
Chris Shibu 1905696
Adilet Eshimkanov 690915
-}

--Question 1.

average :: Float -> Float -> Float -> Float
average x y z = (x + y + z)/3.0


howManyAboveAverage1 :: Float -> Float -> Float -> [Float]
howManyAboveAverage1 x y z = filter (>av) numList
 where { av = average x y z ; numList = [x,y,z] }
 
-- *Main> howManyAboveAverage1 1903451 1905696 690915
-- [1903451.0,1905696.0]


howManyAboveAverage2 :: Float -> Float -> Float -> [Float]
howManyAboveAverage2 x y z = [x | av < x] ++ [y | av < y] ++ [z | av < z]
 where av = average x y z

-- *Main> howManyAboveAverage2 1903451 1905696 690915
-- [1903451.0,1905696.0]


howManyAboveAverageL :: [Float] -> [Float]
howManyAboveAverageL xs = filter (>av) xs
 where av = averageList xs

averageList :: [Float] -> Float
averageList [] = 0
averageList xs = sum xs / len
 where len = fromIntegral (length xs)

-- *Main> howManyAboveAverageL 
--[5,6,8,2,4,6,8,4,1,4,6,9,6,4,2,3,5,7,9,8,4,2,1,4,6,7,9,3]

--[6.0,8.0,6.0,8.0,6.0,9.0,6.0,7.0,9.0,8.0,6.0,7.0,9.0]



-- Question 2

split1 :: (a -> Bool) -> [a] -> ([a], [a])
split1 p xs = ([xs | xs <- xs, p xs], [xs | xs <- xs, (not.p) xs])

split2 :: (a -> Bool) -> [a] -> ([a], [a])
split2 p xs = (filter p xs , filter (not.p) xs)

split3 :: (a -> Bool) -> [a] -> ([a], [a])
split3 p xs = (recursiveSplit p xs, recursiveSplit (not.p) xs)

recursiveSplit :: (a -> Bool) -> [a] -> [a]
recursiveSplit _ [] = []
recursiveSplit p (x:xs) = x : recursiveSplit p (filter (p) xs)


-- Question 3
--         diameter topping  price
alfredo :: Float -> Float -> Float
alfredo d topping = 1.6 * ((area * 0.001) + (topping * (area * 0.002)))
 where area = findArea d

findArea :: Float -> Float
findArea d = pi * ((d/2)^2)

pizzaCompare :: Bool
pizzaCompare = bambini > famiglia
 where { bambini = alfredo 14 6 ; famiglia = alfredo 32 2 }


-- Question 4
divides :: Integer -> Integer -> Bool
divides x y = y `mod` x == 0

prime :: Integer -> Bool
prime n = n > 1 && and [not(divides x n) | x <- [2..(n-1)]]

allPrimes :: [Integer]
allPrimes = [x | x<- [2..], prime x]

allPrimesBetween :: Integer -> Integer -> [Integer]
allPrimesBetween a b = [x | x<- [a..b], prime x]

primeTest :: [Bool]
primeTest = map (prime) [0..]

allNumbers :: [Integer]
allNumbers = [x | x <- [0..]]

primeTestPair :: [(Integer, Bool)]
primeTestPair = zip allNumbers primeTest

