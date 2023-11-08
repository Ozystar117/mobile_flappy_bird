
import 'package:flame/components.dart';
import 'package:flappy_bird/flappy_bird_game.dart';

class BackGround extends SpriteAnimationComponent with HasGameRef<FlappyBirdGame>{
  BackGround({required super.size, required super.position});

  List<Sprite> sprites = [
    FlappyBirdGame.flapySprite(0, 0, 144, 256),
    FlappyBirdGame.flapySprite(146, 0, 144, 256),
  ];
  
  @override
  void onLoad() {
    animation = SpriteAnimation.spriteList(sprites, stepTime: 100);
  }


}