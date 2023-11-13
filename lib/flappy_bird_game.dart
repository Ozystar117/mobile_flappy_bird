import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/actors/bird.dart';
import 'package:flappy_bird/actors/tubes/tube.dart';
import 'package:flappy_bird/actors/tubes/tube_group.dart';
import 'package:flappy_bird/components/background.dart';

class FlappyBirdGame extends FlameGame with TapCallbacks, HasCollisionDetection{

  final World world = World(); // the game world
  late CameraComponent cameraComponent = CameraComponent(world: world)
    ..viewfinder.anchor = Anchor.topLeft;
  static late final double gridSize;
  late Bird bird;
  late final double tubeHorizontalGap;
  late final List<TubeGroup> tubeGroups;
  bool gameOver = false;

  void init(){
    gridSize = size.y * 0.07;
    tubeHorizontalGap = gridSize * 5;

    addAll([cameraComponent, world]);
  }

  @override
  Future<void> onLoad() async {
    init();
    await Flame.images.load('spritesheet.png');

    // background
    world.add(BackGround(size: size, position: Vector2(0,0)));

    // tubes
    tubeGroups = [TubeGroup()..x = size.x * 0.85, TubeGroup()..x = (size.x * 0.85) + tubeHorizontalGap];
    world.addAll(tubeGroups);

    // bird
    bird = Bird(position: Vector2(100,100));
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