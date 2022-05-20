package engine;

import js.lib.Date;

class FPS {
    static var now = Date.now();
    static var prev = Date.now();
    static var deltaTime : Float;

    // private function new() { trace("Don't call this constructor please.    stop"); }

    public static function calcDelta() {
        now = Date.now();
        deltaTime = (now - prev) / 1000;
        prev = now;
    }
    public static function getDeltaTime() {
        return deltaTime;
    }
}