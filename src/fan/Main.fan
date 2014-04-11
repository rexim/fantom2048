
class Main {
    static Void main() {
        gameEngine := GameEngine.make;
        gameUi := GameUi.make;

        gameEngine.renderer = gameUi;
        gameUi.controller = gameEngine;

        echo("Nothing to see here yet.")
    }
}