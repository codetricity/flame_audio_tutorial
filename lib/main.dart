import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGameAudio()));
}

final style = TextStyle(color: BasicPalette.white.color);
final regular = TextPaint(style: style);

class MyGameAudio extends FlameGame with TapDetector, DoubleTapDetector {
  bool playingMusic = false;
  int trackNumber = 1;
  TextComponent instructions = TextComponent();
  final String instructionString = 'play: single tap\n'
      'stop: single tap\n'
      'next song: double tap';

  @override
  Future<void> onLoad() async {
    super.onLoad();

    instructions
      ..text =
          instructionString + '\n track number: $trackNumber\n status: stopped'
      ..textRenderer = regular
      ..y = 100
      ..x = 20;
    add(instructions);
  }

  @override
  void onTapUp(TapUpInfo info) {
    if (!playingMusic) {
      switch (trackNumber) {
        case 1:
          FlameAudio.bgm.play('track_1.mp3');
          playingMusic = true;
          break;
        case 2:
          FlameAudio.bgm.play('track_2.mp3');
          playingMusic = true;
          break;
      }
      instructions.text = instructionString +
          '\n track number: $trackNumber\n'
              'status: playing';
    } else {
      FlameAudio.bgm.stop();
      playingMusic = false;
      instructions.text = instructionString +
          '\n track number: $trackNumber\n'
              'status: stopped';
    }
  }

  @override
  void onDoubleTap() {
    trackNumber++;
    if (trackNumber > 2) {
      trackNumber = 1;
    }
    if (playingMusic) {
      instructions.text = instructionString +
          '\n track number: $trackNumber\n'
              'status: playing';
    } else {
      instructions.text = instructionString +
          '\n track number: $trackNumber\n'
              'status: stopped';
    }
  }
}
