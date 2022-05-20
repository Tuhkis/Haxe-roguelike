package engine;

class Rect {
    public var x : Int = 0;
    public var y : Int = 0;
    public var w : Int = 0;
    public var h : Int = 0;

    public function new(px : Int, py : Int, pw : Int, ph : Int) {
        x = px;
        y = py;
        w = pw;
        h = ph;
    }
    // public function setSize(n : Vector2) {
    // 	size = n;
    // }
    public function collide(rect2 : Rect) {
        if (x + w > rect2.x && x < rect2.x + rect2.w && y + h > rect2.y && y < rect2.y + rect2.h) {
            return true;
        }
        else {
            return false;
        }
    }
    public function collideArr(tiles : Array<Rect>) {
        var collisions : Array<Rect> = new Array<Rect>();
        for (a in tiles) {
            if (a.collide(this)) {
                collisions.insert(0, a);
            }
        }
        return collisions;
    }
    public function move(vx : Int, vy : Int, tiles : Array<Rect>) {
        x += Math.round(vx * FPS.getDeltaTime());
        var coll : Array<Rect> = collideArr(tiles);
        for (c in coll) {
            if (vx > 0) {
                x = c.x - w;
                break;
            }
            else if (vx < 0) {
                x = c.x + c.w;
                break;
            }
        }

        y += Math.round(vy * FPS.getDeltaTime());
        coll = collideArr(tiles);
        for (c in coll) {
            if (vy > 0) {
                y = c.y - h;
                break;
            }
            else if (vy < 0) {
                y = c.y + c.h;
                break;
            }
        }
    }
}