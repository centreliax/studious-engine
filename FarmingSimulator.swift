import Foundation

class Crop {
    var type: String
    var growth: Int
    init(type: String) {
        self.type = type
        self.growth = 0
    }
    func grow() {
        growth += 1
    }
    func harvest() -> Bool {
        if growth >= 3 {
            growth = 0
            return true
        }
        return false
    }
}

class Farm {
    var crops: [Crop] = []
    func plant(type: String) {
        crops.append(Crop(type: type))
    }
    func growCrops() {
        for crop in crops {
            crop.grow()
        }
    }
    func harvestCrops() {
        for crop in crops {
            if crop.harvest() {
                print("Harvested \(crop.type)!")
            }
        }
    }
    func showFarm() {
        for (i, crop) in crops.enumerated() {
            print("Plot \(i): \(crop.type) growth: \(crop.growth)")
        }
    }
}

let farm = Farm()
farm.plant(type: "Wheat")
farm.plant(type: "Corn")

for day in 1...5 {
    print("Day \(day)")
    farm.growCrops()
    farm.harvestCrops()
    farm.showFarm()
}

print("Farming Simulator Ended.")