#include <iostream>
#include <vector>
#include <string>

class Building {
public:
    std::string type;
    int x, y;
    Building(const std::string& t, int x, int y) : type(t), x(x), y(y) {}
};

class City {
    std::vector<Building> buildings;
    int width, height;
public:
    City(int w, int h) : width(w), height(h) {}
    bool addBuilding(const std::string& type, int x, int y) {
        if (x < 0 || y < 0 || x >= width || y >= height) return false;
        buildings.push_back(Building(type, x, y));
        return true;
    }
    void showCity() {
        std::cout << "City Layout:\n";
        for (const auto& b : buildings) {
            std::cout << b.type << " at (" << b.x << ", " << b.y << ")\n";
        }
    }
    int getBuildingCount() {
        return buildings.size();
    }
};

void displayMenu() {
    std::cout << "1. Add House\n2. Add Shop\n3. Show City\n4. Exit\n";
}

int main() {
    City city(10, 10);
    int choice, x, y;
    while (true) {
        displayMenu();
        std::cin >> choice;
        if (choice == 4) break;
        switch (choice) {
        case 1:
            std::cout << "Enter coordinates for House (x y): ";
            std::cin >> x >> y;
            if (city.addBuilding("House", x, y))
                std::cout << "House added.\n";
            else
                std::cout << "Invalid position.\n";
            break;
        case 2:
            std::cout << "Enter coordinates for Shop (x y): ";
            std::cin >> x >> y;
            if (city.addBuilding("Shop", x, y))
                std::cout << "Shop added.\n";
            else
                std::cout << "Invalid position.\n";
            break;
        case 3:
            city.showCity();
            std::cout << "Total buildings: " << city.getBuildingCount() << "\n";
            break;
        default:
            std::cout << "Invalid choice.\n";
        }
    }
    std::cout << "Exiting Simple City Builder.\n";
    return 0;
}