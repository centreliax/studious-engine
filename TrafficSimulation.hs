data Car = Car { carId :: Int, position :: Int } deriving Show

moveCar :: Car -> Int -> Car
moveCar car dist = car { position = position car + dist }

showCars :: [Car] -> IO ()
showCars [] = return ()
showCars (c:cs) = do
    putStrLn $ "Car " ++ show (carId c) ++ " at position " ++ show (position c)
    showCars cs

simulate :: [Car] -> Int -> IO [Car]
simulate cars 0 = return cars
simulate cars n = do
    let moved = map (\c -> moveCar c 1) cars
    showCars moved
    simulate moved (n-1)

main :: IO ()
main = do
    let cars = [Car 1 0, Car 2 5]
    putStrLn "Traffic Simulation Start"
    _ <- simulate cars 5
    putStrLn "Traffic Simulation End"