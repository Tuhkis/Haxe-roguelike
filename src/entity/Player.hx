package entity;

import engine.FPS;
import engine.Sprite;
import main.Main;
import js.html.ImageElement;
import js.html.CanvasRenderingContext2D;
import engine.Input;
import engine.SpriteManager;
import engine.Camera;
import engine.Rect;

class Player extends Entity {
    private var speed : Int = 50;
    var vx : Int = 0;
    var vy : Int = 0;

    var anim : Float = 0.0;
    var animFrame : Int = 0;
    var walking : Bool = false;
    var dir : Int = 0;

    private var spr : Sprite = new Sprite('./assets/player.png', 160, 12, 16); // SpriteManager.load("./assets/player.png")

    public function new(pcam : Camera, px : Int = 0, py : Int = 0) {
        super(pcam);
        hb.x = px;
        hb.y = py;
    }
    public override function tick(tiles : Array<Rect>) {
        hb.w = 10;
        hb.h = 5;
        vx = 0;
        vy = 0;
        if (Input.isPressed('d')) {
            vx += speed;
            dir = 2;
        }
        if (Input.isPressed('a')) {
            vx -= speed;
            dir = 3;
        }
        if (Input.isPressed('s')) {
            vy += speed;
            dir = 0;
        }
        if (Input.isPressed('w')) {
            vy -= speed;
            dir = 1;
        }

        hb.move(vx, vy, tiles);

        cam.setX(hb.x - 100 + 16);
        cam.setY(hb.y - 100 + 28);

        // Handle Animations
        if (vx != 0 || vy != 0) {
            walking = true;
            Main.mainScene.particles.emitParticle(hb.x + 5, hb.y + 2, 2, 25, (vx) * -1 / 25 * (Math.random() + 0.2), -17 * Math.random(), 2);
        }
        else {
            walking = false;
        }

        anim += 2 * FPS.getDeltaTime();
        animate();

        if (Input.isPressed('e')) cam.setTrauma(10.0);
    }
    public override function render(g : CanvasRenderingContext2D) {
        g.fillStyle = '#FF0000';
        g.fillRect(hb.x - cam.getX(), hb.y - cam.getY(), hb.w, hb.h);

        spr.draw(g, hb.x - cam.getX(), hb.y - 7 - cam.getY(), 10, 12, animFrame);
    }
    private function animate() {
        switch (Math.round(anim) % 2) {
            case 0:
                switch (dir) {
                    case 0:
                        if (walking) animFrame = 2;
                        else animFrame = 0;
                    case 1:
                        if (walking) animFrame = 6;
                        else animFrame = 4;
                    case 2:
                        if (walking) animFrame = 10;
                        else animFrame = 8;
                    case 3:
                        if (walking) animFrame = 14;
                        else animFrame = 12;
                }
            case 1:
                switch (dir) {
                    case 0:
                        if (walking) animFrame = 3;
                        else animFrame = 1;
                    case 1:
                        if (walking) animFrame = 7;
                        else animFrame = 5;
                    case 2:
                        if (walking) animFrame = 11;
                        else animFrame = 9;
                    case 3:
                        if (walking) animFrame = 15;
                        else animFrame = 13;
                }
        }
    }
}
/*
switch (Math.round(anim) % 2) {
    case 0:
        if (walking) animFrame = 2;
        else animFrame = 0;
    case 1:
        if (walking) animFrame = 3;
        else animFrame = 1;
}
*/