# Flutter Flame Audio Demonstration

Code for free Flame course at:

https://codecakes.teachable.com/

In build.gradle under android.

```
buildscript {
    ext.kotlin_version = '1.5.10'
    repositories {
        google()
```

## Web Demonstration

The audio files take some time to load.

https://codetricity.github.io/flame_audio_tutorial/

## Build for Web

```text
flutter build web --base-href=/flame_audio_tutorial/
```

## dispose of audio resources

https://discord.com/channels/509714518008528896/516639688581316629/935538423576547368

> You can override onRemove in the game, that one will be called when the widget is disposed.
