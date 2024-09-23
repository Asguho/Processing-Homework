// State interface
interface GameState {
  void nextState();  // Renamed from update
  void draw();
}

// Start State
class StartState implements GameState {
  public void nextState() {
    if (mousePressed) {
      game.setState(new PlayingState());
    }
  }

  public void draw() {
    background(0);
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Click to Start", width / 2, height / 2);
  }
}

// Playing State
class PlayingState implements GameState {
  int playerX, playerY;

  PlayingState() {
    playerX = width / 2;
    playerY = height - 50;
  }

  public void nextState() {
    if (keyPressed) {
      if (key == 'a') playerX -= 3;
      if (key == 'd') playerX += 3;
    }

    if (playerX > width || 0 > playerX) {  
      game.setState(new GameOverState());
    }
  }

  public void draw() {
    background(50, 150, 200);
    fill(255);
    rect(playerX, playerY, 50, 50);
  }
}

// Game Over State
class GameOverState implements GameState {
  public void nextState() {
    if (mousePressed) {
      game.setState(new StartState());  // Restart the game on mouse press
    }
  }

  public void draw() {
    background(150, 50, 50);
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Game Over\nClick to Restart", width / 2, height / 2);
  }
}

// Game context
class Game {
  GameState currentState;

  Game() {
    currentState = new StartState();  // Set initial state
  }

  void setState(GameState state) {
    currentState = state;
  }

  void update() {
    currentState.nextState();  // Call the next state method
  }

  void draw() {
    currentState.draw();
  }
}

Game game;

void setup() {
  size(600, 400);
  game = new Game();  // Initialize the game
}

void draw() {
  game.update(); 
  game.draw();
}
