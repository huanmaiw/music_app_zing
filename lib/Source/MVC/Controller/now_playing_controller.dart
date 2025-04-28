import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Model/song_model.dart';
import 'package:zingmp5/Source/MVC/Model/song_model2.dart';


class NowPlayingController extends GetxController {
  var currentSong = Rx<Song>(Song(title: "", artist: "", imageUrl: "", duration: Duration.zero)); // Song model
  var isPlaying = false.obs;
  var position = Rx<Duration>(Duration.zero);
  var duration = Rx<Duration>(Duration.zero);

  final MusicService _musicService = MusicService();

  @override
  void onInit() {
    super.onInit();
    fetchCurrentSong();
  }

  void fetchCurrentSong() async {
    // Giả sử gọi API để lấy bài hát hiện tại
    Song song = await _musicService.getCurrentSong();
    currentSong.value = song;
    duration.value = song.duration;
  }

  void playPause() {
    isPlaying.value = !isPlaying.value;
    if (isPlaying.value) {
      // Gọi API để phát nhạc
      _musicService.playSong(currentSong.value);
    } else {
      // Gọi API để tạm dừng nhạc
      _musicService.pauseSong();
    }
  }

  void seekTo(double value) {
    position.value = Duration(seconds: value.toInt());
    // Gọi API để chuyển bài hát đến thời điểm mới
    _musicService.seekTo(position.value);
  }

  String formatTime(Duration duration) {
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}
