package engine;

import js.html.ImageElement;
import js.html.CanvasRenderingContext2D;

class Tile {
    static var spr : ImageElement;
    public static var cellSize : Int = 12;
    var x : Int;
    var y : Int;
    var frame : Int;
    public function new(pspr : String, px : Int, py : Int, pframes : Int) {
        spr = SpriteManager.load(pspr);
        x = px * cellSize;
        y = py * cellSize;
        frame = pframes;
    }
    public function draw(g : CanvasRenderingContext2D, cam : Camera) {
        g.drawImage(spr, frame * cellSize, 0, cellSize, cellSize, x - cam.getX(), y - cam.getY(), cellSize, cellSize);
    }
}