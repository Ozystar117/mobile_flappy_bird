import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/actors/bird.dart';
import 'package:flappy_bird/components/background.dart';

class FlappyBirdGame extends FlameGame with TapCallbacks{

  final World world = World(); // the game world
  late CameraComponent cameraComponent = CameraComponent(world: world)
    ..viewfinder.anchor = Anchor.topLeft;
  static late final double gridSize;
  late Bird bird;

  @override
  Future<void> onLoad() async {
    await Flame.images.load('spritesheet.png');

    gridSize = size.y * 0.05;

    addAll([cameraComponent, world]);

    bird = Bird(position: Vector2(100,100));
    world.add(BackGround(size: size, position: Vector2(0,0)));
    world.add(bird);
    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    bird.jump();
    super.onTapUp(event);
  }

  static Sprite flapySprite(double x, double y, double width, double height) {
    return Sprite(
      Flame.images.fromCache('spritesheet.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }
}