import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../Model/song_model.dart';

class NowPlayingController extends GetxController {
  final AudioPlayer player = AudioPlayer();

  var currentSong = SongModel(
    title: 'Bắc Bling (Bắc Ninh)',
    artist: 'Hòa Minzy, Xuân Hinh, Tuấn Cry',
    imageUrl: 'https://i.imgur.com/xh8VCFf.jpeg',
    url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    duration: const Duration(minutes: 4, seconds: 5),
  ).obs;

  var position = Duration.zero.obs;
  var duration = const Duration(minutes: 4, seconds: 5).obs;
  var isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    setupAudio();
  }

  void setupAudio() async {
    await player.setUrl(currentSong.value.url);
    player.positionStream.listen((pos) => position.value = pos);
    player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
    });
  }

  void playPause() {
    isPlaying.value ? player.pause() : player.play();
  }

  void seekTo(double seconds) {
    player.seek(Duration(seconds: seconds.toInt()));
  }

  String formatTime(Duration d) {
    return d.toString().split('.').first.substring(2, 7);
  }
}
