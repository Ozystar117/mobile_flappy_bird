import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flappy_bird/flappy_bird_game.dart';

class Tube extends SpriteComponent with HasGameRef<FlappyBirdGame>{
  // Tube({required this.sprite});
  Tube(){
    size.x = FlappyBirdGame.gridSize + ( FlappyBirdGame.gridSize * 0.3);
  }
  // final Sprite sprite;

  // void drawSprite(Canvas canvas, Sprite sprite, Vector2 size, {double scale = 1}){
  //   sprite.render(
  //     canvas,
  //     position: Vector2(size.x, size.y),
  //     anchor: Anchor.center,
  //     size: sprite.srcSize.scaled(scale),
  //   );
  // }

  //
  // @override
  // void render(Canvas canvas) {
  //   drawSprite(canvas, sprite, size);
  //   super.render(canvas);
  // }
}