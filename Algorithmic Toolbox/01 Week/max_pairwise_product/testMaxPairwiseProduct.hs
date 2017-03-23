module TestMaxPairwiseProduct where

import System.Random (randomRIO)
import MaxPairwiseProduct (maxPairwiseProduct)
import StressTest (stressTest)

randomList :: Int -> IO [Int]
randomList 0 = return []
randomList n = do
  r <- randomRIO (1, 1000000)
  rs <- randomList (n - 1)
  return (r:rs)

maxPairwiseProduct2 :: (Num a, Ord a) => [a] -> a
maxPairwiseProduct2 nums = biggest * nextBiggest
  where
    biggest = maximum nums
    nextBiggest = maximum $ filter (/= biggest) nums

main = stressTest maxPairwiseProduct maxPairwiseProduct2 (randomList 1000)
