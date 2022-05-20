package engine;

import js.html.CanvasRenderingContext2D;

class Particles {
    var particles : Array<Array<Float>> = [];
    public function new() {
        
    }
    public function tick() {
        for (p in particles) {
            p[0] += p[4] * FPS.getDeltaTime();
            p[1] += p[5] * FPS.getDeltaTime();

            p[5] += p[3] * FPS.getDeltaTime();
            p[6] += FPS.getDeltaTime();

            if (p[2] > 0) p[2] -= p[7] * FPS.getDeltaTime();
            else p[2] = 0;

            if (p[6] >= 3) particles.remove(p);
        }
    }
    public function render(g : CanvasRenderingContext2D, cam : Camera) {
        for (p in particles) {
            g.fillStyle = '#d5d5d5';
            g.fillRect(p[0] - p[2] / 2 - cam.getX(), p[1] - p[2] / 2 - cam.getY(), p[2], p[2]);
        }
    }
    public function emitParticle(x : Int, y : Int, d : Int, g : Int, fx : Float = 0, fy : Float = 0, shrink : Float = 0) {
        particles.push([x, y, d, g, fx, fy, 0.0, shrink]);
    }
}