package engine;

import js.html.CanvasRenderingContext2D;
import js.html.ImageElement;

class Sprite {
    final img : ImageElement;
    final w : Int;
    final h : Int;
    final fs : Int;
    public function new(path : String, pw : Int, ph : Int, pfs : Int) {
        img = SpriteManager.load(path);
        w = pw;
        h = ph;
        fs = pfs;
    }
    public function draw(g : CanvasRenderingContext2D, x : Int, y : Int, pw : Int, ph : Int, f : Int) {
        g.drawImage(img, w / fs * f, 0, w / fs, h, x, y, pw, ph);
    }
}