
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/actors/tubes/tube.dart';
import 'package:flappy_bird/flappy_bird_game.dart';

class Bird extends SpriteAnimationComponent with CollisionCallbacks, HasGameRef<FlappyBirdGame>{
  Bird({required super.position}):super(size: Vector2.all(FlappyBirdGame.gridSize - (FlappyBirdGame.gridSize * 0.2)), anchor: Anchor.center);

  final List<Sprite> sprites = [
    FlappyBirdGame.flapySprite(3, 491, 17, 12),
    FlappyBirdGame.flapySprite(31, 491, 17, 12),
    FlappyBirdGame.flapySprite(59, 491, 17, 12),
  ];

  final double gravity = FlappyBirdGame.gridSize/5;
  double velocity = 0;
  final double jumpSpeed = FlappyBirdGame.gridSize * 5;

  void jump(){
    velocity = -jumpSpeed;
  }

  @override
  void onLoad() {
    FlappyBirdGame.flapySprite(x, y, width, height);
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.12);
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    if(!game.gameOver){
      velocity += gravity;
      position.y += velocity * dt;

      // TEMPORARY: Prevent the bird from falling off the screen
      if(position.y >= game.size.y - size.y){
        position.y = game.size.y - size.y;
      }
    }


    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is Tube){
      // game over
      game.gameOver = true;
    }
    super.onCollision(intersectionPoints, other);
  }

}