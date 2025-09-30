struct Spaceship {
    name: String,
    x: i32,
    y: i32,
    fuel: i32,
}

impl Spaceship {
    fn move_ship(&mut self, dx: i32, dy: i32) {
        if self.fuel > 0 {
            self.x += dx;
            self.y += dy;
            self.fuel -= 1;
        }
    }
    fn status(&self) {
        println!("{} at ({}, {}) | Fuel: {}", self.name, self.x, self.y, self.fuel);
    }
}

struct SpaceSim {
    ships: Vec<Spaceship>,
}

impl SpaceSim {
    fn new() -> SpaceSim {
        SpaceSim { ships: vec![] }
    }
    fn add_ship(&mut self, name: &str, x: i32, y: i32, fuel: i32) {
        self.ships.push(Spaceship {
            name: name.to_string(),
            x,
            y,
            fuel,
        });
    }
    fn move_all(&mut self) {
        for ship in &mut self.ships {
            ship.move_ship(1, 1);
        }
    }
    fn show(&self) {
        for ship in &self.ships {
            ship.status();
        }
    }
}

fn main() {
    let mut sim = SpaceSim::new();
    sim.add_ship("Apollo", 0, 0, 5);
    sim.add_ship("Challenger", 2, 2, 3);
    for _ in 0..5 {
        sim.move_all();
        sim.show();
    }
    println!("Space Simulation Ended.");
}