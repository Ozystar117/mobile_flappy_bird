import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flappy_bird/actors/tubes/bottom_tube.dart';
import 'package:flappy_bird/actors/tubes/top_tube.dart';
import 'package:flappy_bird/actors/tubes/tube.dart';
import 'package:flappy_bird/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class TubeGroup extends PositionComponent with HasGameRef<FlappyBirdGame>{
  final Tube topTube = TopTube();
  final Tube bottomTube = BottomTube();
  // List<Tube> tubes = [TopTube(), BottomTube()];
  final double gap = FlappyBirdGame.gridSize * 3;
  final double velocity = FlappyBirdGame.gridSize * 2;


  TubeGroup(){
    size.x = topTube.size.x;
  }


  double doubleInRange(num start, num end) =>
      Random().nextDouble() * (end - start) + start;

  void reset(){
    if(x + size.x < 0){
      updateSize();
      x = game.tubeGroups.where((tube) => tube.x > x).first.x + game.tubeHorizontalGap;
    }

  }

  void updateSize(){
    topTube.size.y = doubleInRange(0.25 * game.size.y, 0.76 * game.size.y); // 25% - 75%

    bottomTube.y = topTube.size.y + gap;
    bottomTube.size.y = game.size.y - bottomTube.y;
  }

  @override
  void onLoad() {
    updateSize();

    game.world.addAll([topTube, bottomTube]);
  }

  @override
  void update(double dt) {
    reset();
    x -= velocity * dt;
    topTube.x = x;
    bottomTube.x = x;

    super.update(dt);
  }

}