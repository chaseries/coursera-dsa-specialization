import Control.Applicative ((<$>))

getEm :: (Ord a) => (a, a) -> a -> (a, a)
getEm (x, y) a
  | a >= x = (a, x)
  | a >= y = (x, a) -- Technically not necessary to use >= given (0, 1)
  | otherwise = (x, y)

-- Uses (0, 1) because:
-- case [] = 0 * 1 = 0
-- case [n] = n * 1 = n
maxPairwiseProduct :: (Num a, Ord a) => [a] -> a
maxPairwiseProduct nums = fst res * snd res
  where res = foldl getEm (0, 1) nums

main = do
  length <- getLine
  rawNums <- words <$> getLine
  let nums = read <$> rawNums :: [Int]
  putStrLn $ show $ maxPairwiseProduct nums
