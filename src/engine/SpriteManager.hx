package engine;

import js.html.ImageElement;

import js.Browser.document;

class SpriteManager {
    private function new() {
        trace("This method shouldn't be called");
    }
    public static function load(path : String) {
        var image : ImageElement = document.createImageElement();
        image.src = path;
        return image;
    }
}