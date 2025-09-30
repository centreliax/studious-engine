<?php
class Business {
    public $name;
    public $income;
    public $employees;

    function __construct($name, $income, $employees) {
        $this->name = $name;
        $this->income = $income;
        $this->employees = $employees;
    }

    function hireEmployee() {
        $this->employees += 1;
        $this->income += 100;
    }

    function fireEmployee() {
        if ($this->employees > 0) {
            $this->employees -= 1;
            $this->income -= 80;
        }
    }

    function status() {
        echo "{$this->name}: Income {$this->income}, Employees {$this->employees}\n";
    }
}

class TycoonGame {
    public $businesses = [];

    function addBusiness($name) {
        $this->businesses[] = new Business($name, 500, 5);
    }

    function simulateDay() {
        foreach ($this->businesses as $b) {
            if (rand(0,1)) $b->hireEmployee();
            else $b->fireEmployee();
        }
    }

    function showStatus() {
        foreach ($this->businesses as $b) {
            $b->status();
        }
    }
}

$game = new TycoonGame();
$game->addBusiness("Bakery");
$game->addBusiness("Cafe");

for ($i = 1; $i <= 5; $i++) {
    echo "Day $i\n";
    $game->simulateDay();
    $game->showStatus();
}
echo "Tycoon Game Ended.\n";
?>