import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

class FlappyBirdGame extends FlameGame{

  final World world = World(); // the game world
  late CameraComponent cameraComponent = CameraComponent(world: world)..viewfinder.anchor = Anchor.topCenter;

  @override
  Future<void> onLoad() async{
    await Flame.device.setLandscapeLeftOnly();
    await Future.delayed(const Duration(seconds: 1)); // wait for 1s for the game.size to be updated

    addAll([cameraComponent ,world]);
    return super.onLoad();
  }
}