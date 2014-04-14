using fwt
using gfx

class Main {
    static Void main() {
        gameEngine := GameEngine.make;
        gameUi := GameUi.make;

        gameEngine.renderer = gameUi;
        gameUi.controller = gameEngine;

        Window {
            size = Size(300, 200)
            gameUi,
        }.open
    }
}
