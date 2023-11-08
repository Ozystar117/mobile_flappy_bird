
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flappy_bird/flappy_bird_game.dart';

class Bird extends SpriteAnimationComponent with HasGameRef<FlappyBirdGame>{
  Bird({required super.position}):super(size: Vector2.all(FlappyBirdGame.gridSize));

  final List<Sprite> sprites = [
    FlappyBirdGame.flapySprite(3, 491, 17, 12),
    FlappyBirdGame.flapySprite(31, 491, 17, 12),
    FlappyBirdGame.flapySprite(59, 491, 17, 12),
  ];

  final double gravity = FlappyBirdGame.gridSize/10;
  double velocity = 0;
  final double jumpSpeed = FlappyBirdGame.gridSize * 4;

  void jump(){
    velocity = -jumpSpeed;
  }

  @override
  void onLoad() {
    FlappyBirdGame.flapySprite(x, y, width, height);
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.12);
  }

  @override
  void update(double dt) {
    velocity += gravity;
    position.y += velocity * dt;

    // TEMPORARY: Prevent the bird from falling off the screen
    if(position.y >= game.size.y - size.y){
      position.y = game.size.y - size.y;
    }

    super.update(dt);
  }

}