package engine;

import js.html.CanvasRenderingContext2D;
import haxe.ds.List;
import entity.Entity;

class Scene {
    var entities : List<Entity> = new List<Entity>();
    public var camera : Camera = new Camera();

    var collisionTiles : Array<Rect> = [];
    var tiles : Array<Tile> = [];
    public var particles = new Particles();
    public function new() {
    }
    public function addTile(x : Int, y : Int, path : String, frame : Int, collideable : Bool = true) {
        if (collideable) collisionTiles.push(new Rect(x * Tile.cellSize, y * Tile.cellSize, Tile.cellSize, Tile.cellSize));
        tiles.push(new Tile(path, x, y, frame));
    }

    public function getEntities() {
        return entities;
    }
    public function addEntity(ent : Entity) {
        entities.add(ent);
    }
    public function removeEntity(ent : Entity) {
        entities.remove(ent);
    }

    public function tick() {
        camera.tick();
        for (e in entities) {
            e.tick(collisionTiles);
        }
        particles.tick();
    }
    public function render(g : CanvasRenderingContext2D) {
        for (t in tiles) {
            t.draw(g, camera);
        }
        particles.render(g, camera);
        for (e in entities) {
            e.render(g);
        }
    }
    public function getColl() {
        return collisionTiles;
    }
}