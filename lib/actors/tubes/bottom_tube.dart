import 'package:flappy_bird/actors/tubes/tube.dart';

import '../../flappy_bird_game.dart';

class BottomTube extends Tube{
  @override
  void onLoad() {
    super.onLoad();
    sprite = FlappyBirdGame.flapySprite(84, 323, 26, 160);
  }
}