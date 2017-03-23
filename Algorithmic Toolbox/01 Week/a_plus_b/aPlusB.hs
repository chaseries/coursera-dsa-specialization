
main = do
  inp <- getLine
  let nums = fmap read (words inp)
  putStrLn $ show $ foldl (+) 0 nums
