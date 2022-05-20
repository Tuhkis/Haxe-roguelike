package engine;

import engine.Input;

class Camera {
    var x : Int = 0;
    var y : Int = 0;
    var z : Float = 0.0;
    
    public function new() {
    }
    public function getX() {
        return x + Math.round(Math.sin(z) * (z / 6.0));
    }
    public function getY() {
        return y + Math.round(Math.sin(z) * (z / 8.0));
    }
    public function tick() {
        z -= 45 * FPS.getDeltaTime();
        if (z < 0) z = 0;
    }

    public function setX(px : Int) {
        x = px;
    }
    public function setY(py : Int) {
        y = py;
    }
    public function setTrauma(trauma : Float) {
        z = trauma;
    }
}