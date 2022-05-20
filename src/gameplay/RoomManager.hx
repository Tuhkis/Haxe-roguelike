package gameplay;

import engine.Tile;
import engine.Scene;

class RoomManager {
    private function new() {}

    private static function pgenerateRoom(px : Int, py : Int, entrance : String, exit : String) {
        var tiles : Array<Array<Int>> = [];

        for (x in 0...14) {
            if ((x == 6 || x == 7) && (entrance == 'north' || exit == 'north')) tiles.push([x + 14 * px, 9 * py, 0, 0]);
            else tiles.push([x + 14 * px, 9 * py, 1, 1]);
        }
        for (y in 1...8) {
            if (y == 4 && (entrance == 'west' || exit == 'west')) tiles.push([14 * px, y + 9 * py, 0, 0]); else tiles.push([14 * px, y + 9 * py, 1, 1]);
            for (x in 0...12) {
                tiles.push([x + 1 + 14 * px, y + 9 * py, 0, 0]);
            }
            if (y == 4 && (entrance == 'east' || exit == 'east')) tiles.push([13 + 14 * px, y + 9 * py, 0, 0]); else tiles.push([13 + 14 * px, y + 9 * py, 1, 1]);
        }
        for (x in 0...14) {
            if ((x == 6 || x == 7) && (entrance == 'south' || exit == 'south')) tiles.push([x + 14 * px, 8 + 9 * py, 0, 0]);
            else tiles.push([x + 14 * px, 8 + 9 * py, 1, 1]);
        }
        return tiles;
    }
    private static function generateRoom(x : Int, y : Int, scene : Scene, entrance : String, exit : String) {
        for(t in pgenerateRoom(x, y, entrance, exit)){
            var coll : Bool;
            if (t[3] == 0) coll = false;
            else coll = true;
            scene.addTile(t[0], t[1], './assets/tile.png', t[2], coll);
        }
    }

    public static function generateMap(scene : Scene) {
        var cardinals : Array<String> = ['west', 'south', 'east', 'north'];
        var prevExit = 'north';
        var rx = 0;
        var ry = 1;
        var usedRooms : Array<Array<Int>> = [[0, 0]];
        generateRoom(0, 0, scene, 'NO THE SUN IS A DEADLY LAZER!!!', 'south');

        var currDir : String = 'south';
        for (r in 0...5) {
            generateRoom(rx, ry, scene, prevExit, currDir);
            prevExit = currDir;
            switch (prevExit) {
                case 'south':
                    prevExit = 'north';
                case 'north':
                    prevExit = 'south';
                case 'west':
                    prevExit = 'east';
                case 'east':
                    prevExit = 'west';
            }
            usedRooms.push([rx, ry]);
            while (usedRooms[usedRooms.length - 1][0] == rx && usedRooms[usedRooms.length - 1][1] == ry) {
                currDir = cardinals[Math.floor(Math.random() * 4)];
                
                while (currDir == prevExit) {
                    currDir = cardinals[Math.floor(Math.random() * 4)];
                }
                trace(currDir);
                if (currDir == 'west') rx -= 1;
                if (currDir == 'east') rx += 1;
                if (currDir == 'north') ry -= 1;
                if (currDir == 'south') ry += 1;
            }
            
        }
    }
}