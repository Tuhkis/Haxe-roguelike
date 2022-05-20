package main;

import gameplay.RoomManager;
import js.html.CanvasElement;
import entity.Player;
import engine.Input;
import js.html.CanvasRenderingContext2D;
import js.Browser.document;
import js.Browser.window;
import engine.FPS;
import engine.Scene;

// Run with "npm run tauri dev"

class Main {
    public static var mainScene : Scene = new Scene();
    static var canv : CanvasElement;
    static final FPSINT : Int = 60;
    static function main() {
        // Initialise input
        var inp = new Input();
        // Create canvas
        canv = document.createCanvasElement();
        canv.setAttribute('width', /*window.innerWidth*/ '2000'); // 1008
        canv.setAttribute('height', /*window.innerHeight*/ '2000'); // 648
        canv.setAttribute('id', 'canvid');
        document.body.appendChild(canv);
        // Get rendering context
        final g = canv.getContext2d();
        g.imageSmoothingEnabled = false;
        g.scale(6, 6);

        ready();
        window.setInterval(function() {
            game(g);
        },
        1000 / FPSINT);
    }
    static function game(g : CanvasRenderingContext2D) {
        FPS.calcDelta();
        tick();
        render(g);
    }
    static function tick() {
        mainScene.tick();

        // mainScene.particles.emitParticle(32, 32, 2, 8, Math.random() * 25, Math.random() * -13, 1);
    }
    static function render(g : CanvasRenderingContext2D) {
        g.clearRect(0, 0, canv.width, canv.height);
        // g.fillStyle = '#000000';
        // g.fillRect(0, 0, canv.width, canv.height);

        mainScene.render(g);
    }
    static function ready() {
        mainScene.addEntity(new Player(mainScene.camera, 15, 15));

        RoomManager.generateMap(mainScene);

        /* for (y in 0...9) {
            for (x in 0...14) {
                mainScene.addTile(x, y, './assets/tile.png', 0, false);
            }
        }
        for (x in 0...14) {
            mainScene.addTile(x, 0, './assets/tile.png', 1, true);
        }
        for (x in 0...14) {
            mainScene.addTile(x, 8, './assets/tile.png', 1, true);
        } */
    }
}