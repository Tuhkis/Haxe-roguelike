package entity;

import js.html.CanvasRenderingContext2D;
import engine.Rect;
import engine.Camera;

class Entity {
    var hb : Rect = new Rect(0, 0, 64, 64);
    var cam : Camera;

    public function new(pcam : Camera) {
        cam = pcam;
    }

    public function tick(tiles : Array<Rect>) {
        
    }
    public function render(g : CanvasRenderingContext2D) {

    }
}