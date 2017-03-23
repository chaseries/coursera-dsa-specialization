module StressTest where


stressTest alg1 alg2 inpGen = do
  inp <- inpGen
  let res1 = alg1 inp
  let res2 = alg2 inp
  let inpStr = "Input: " ++ (show inp) ++ " "
  let resStr =  "Result 1: " ++ (show res1) ++ ", Result 2: " ++ (show res2)
  if res1 == res2
     then do
       putStrLn "---- THE RESULT BELOW IS CORRECT ----"
       putStrLn inpStr
       putStrLn resStr
       stressTest alg1 alg2 inpGen
     else do
       putStrLn "---- THE RESULT BELOW IS BROKEN ----"
       putStrLn inpStr
       putStrLn resStr


