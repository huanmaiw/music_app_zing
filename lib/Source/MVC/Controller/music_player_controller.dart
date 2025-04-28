import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  RxBool isFavorite = false.obs;
  RxList<Map<String, String>> favorites = <Map<String, String>>[].obs;  //
  void toggleFavorite(Map<String, String> song) {
    if (isFavorite.value) {
      favorites.remove(song);
    } else {
      favorites.add(song);
    }
    isFavorite.value = !isFavorite.value;
  }

  var playlist = <Map<String, String>>[].obs;
  void addSong(Map<String, String> song) {
    playlist.add(song);
  }
  var isPlaying = false.obs;
  var isShuffle = false.obs;
  var isRepeat = false.obs;
  var currentPosition = Duration.zero.obs;
  var totalDuration = Duration.zero.obs;

  AudioPlayer get audioPlayer => _audioPlayer;

  @override
  void onInit() {
    super.onInit();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    try {
      await _audioPlayer.setUrl('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');

      _audioPlayer.playerStateStream.listen((state) {
        isPlaying.value = state.playing;
      });

      _audioPlayer.durationStream.listen((duration) {
        if (duration != null) {
          totalDuration.value = duration;
        }
      });

      _audioPlayer.positionStream.listen((position) {
        currentPosition.value = position;
      });
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  void togglePlayPause() {
    if (isPlaying.value) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  void toggleShuffle() => isShuffle.toggle();
  void toggleRepeat() => isRepeat.toggle();

  void seekTo(Duration position) => _audioPlayer.seek(position);

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
