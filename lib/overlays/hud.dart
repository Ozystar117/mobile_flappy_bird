import 'dart:ffi';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flappy_bird/flappy_bird_game.dart';

class Hud extends PositionComponent with HasGameRef<FlappyBirdGame>{
  // List<SpriteComponent> scoreToDisplay = [];
  List<SpriteComponent> scoreToDisplay = [];

  final Map<int, Sprite> scoresMap = {
    0 : FlappyBirdGame.flapySprite(496, 60, 12, 18),
    1 : FlappyBirdGame.flapySprite(136, 455, 8, 18),
    2 : FlappyBirdGame.flapySprite(292, 160, 12, 18),
    3 : FlappyBirdGame.flapySprite(306, 160, 12, 18),
    4 : FlappyBirdGame.flapySprite(320, 160, 12, 18),
    5 : FlappyBirdGame.flapySprite(334, 160, 12, 18),
    6 : FlappyBirdGame.flapySprite(292, 184, 12, 18),
    7 : FlappyBirdGame.flapySprite(306, 184, 12, 18),
    8 : FlappyBirdGame.flapySprite(320, 184, 12, 18),
    9 : FlappyBirdGame.flapySprite(334, 184, 12, 18)
  };

  @override
  void onLoad() {
    displayScoreSprite();
  }

  void displayScoreSprite(){
    scoreToDisplay.clear();
    removeWhere((component) => component is SpriteComponent);


    String scoreStr = game.score.toString();

    double spriteSize = FlappyBirdGame.gridSize/2;

    for(int i = 0; i < scoreStr.length; i++){
      add(SpriteComponent(
          sprite: scoresMap[int.parse(scoreStr[i])],
          size: Vector2.all(spriteSize),
          position: Vector2((game.size.x/ 2 - ((scoreStr.length/2) * spriteSize)) + (i * FlappyBirdGame.gridSize/2), FlappyBirdGame.gridSize * 1.5),
          anchor: Anchor.center
      ));
    }

  }

  @override
  void update(double dt) {
    displayScoreSprite();
    if(!game.gameOver){
      game.score++;
    }

    super.update(dt);
  }
  
}