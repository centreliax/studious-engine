using System;
using System.Collections.Generic;

class Tower {
    public string Type { get; set; }
    public int Position { get; set; }
    public int Damage { get; set; }
    public Tower(string type, int pos, int dmg) {
        Type = type;
        Position = pos;
        Damage = dmg;
    }
}

class Enemy {
    public int Health { get; set; }
    public int Position { get; set; }
    public Enemy(int health, int pos) {
        Health = health;
        Position = pos;
    }
}

class Game {
    List<Tower> towers = new List<Tower>();
    List<Enemy> enemies = new List<Enemy>();
    public void AddTower(string type, int pos, int dmg) {
        towers.Add(new Tower(type, pos, dmg));
    }
    public void SpawnEnemy(int health, int pos) {
        enemies.Add(new Enemy(health, pos));
    }
    public void Update() {
        foreach (var tower in towers) {
            foreach (var enemy in enemies) {
                if (enemy.Position == tower.Position) {
                    enemy.Health -= tower.Damage;
                    Console.WriteLine($"{tower.Type} hits Enemy at {enemy.Position} for {tower.Damage} damage.");
                }
            }
        }
        enemies.RemoveAll(e => e.Health <= 0);
        foreach (var enemy in enemies) enemy.Position++;
    }
    public void DisplayState() {
        Console.WriteLine("Towers:");
        foreach (var t in towers)
            Console.WriteLine($"{t.Type} at {t.Position} (Damage: {t.Damage})");
        Console.WriteLine("Enemies:");
        foreach (var e in enemies)
            Console.WriteLine($"Enemy at {e.Position} (Health: {e.Health})");
    }
}

class Program {
    static void Main() {
        Game game = new Game();
        game.AddTower("Cannon", 2, 10);
        game.AddTower("Laser", 4, 15);
        game.SpawnEnemy(25, 0);
        game.SpawnEnemy(30, 1);
        for (int i = 0; i < 5; i++) {
            Console.WriteLine($"Turn {i + 1}");
            game.Update();
            game.DisplayState();
        }
        Console.WriteLine("Game Over.");
    }
}