package main

import (
	"fmt"
)

type Unit struct {
	Name   string
	X, Y   int
	Health int
}

type Resource struct {
	Type string
	X, Y int
	Amount int
}

type RTSGame struct {
	Units     []Unit
	Resources []Resource
}

func (g *RTSGame) AddUnit(name string, x, y, health int) {
	g.Units = append(g.Units, Unit{Name: name, X: x, Y: y, Health: health})
}

func (g *RTSGame) AddResource(typ string, x, y, amount int) {
	g.Resources = append(g.Resources, Resource{Type: typ, X: x, Y: y, Amount: amount})
}

func (g *RTSGame) MoveUnit(idx, dx, dy int) {
	if idx >= 0 && idx < len(g.Units) {
		g.Units[idx].X += dx
		g.Units[idx].Y += dy
	}
}

func (g *RTSGame) GatherResource(unitIdx, resIdx int) {
	if unitIdx < len(g.Units) && resIdx < len(g.Resources) {
		u := &g.Units[unitIdx]
		r := &g.Resources[resIdx]
		if u.X == r.X && u.Y == r.Y && r.Amount > 0 {
			r.Amount--
			fmt.Printf("%s gathered 1 %s\n", u.Name, r.Type)
		}
	}
}

func (g *RTSGame) ShowState() {
	fmt.Println("Units:")
	for _, u := range g.Units {
		fmt.Printf("%s at (%d,%d) Health: %d\n", u.Name, u.X, u.Y, u.Health)
	}
	fmt.Println("Resources:")
	for _, r := range g.Resources {
		fmt.Printf("%s at (%d,%d) Amount: %d\n", r.Type, r.X, r.Y, r.Amount)
	}
}

func main() {
	game := RTSGame{}
	game.AddUnit("Soldier", 1, 1, 100)
	game.AddUnit("Worker", 2, 2, 50)
	game.AddResource("Gold", 2, 2, 5)
	game.AddResource("Wood", 3, 3, 10)
	for i := 0; i < 3; i++ {
		game.MoveUnit(1, 0, 0)
		game.GatherResource(1, 0)
		game.ShowState()
	}
	fmt.Println("RTS Game Ended.")
}