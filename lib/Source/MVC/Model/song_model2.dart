import 'song_model.dart';
class MusicService {
  Future<Song> getCurrentSong() async {
    // Giả sử bạn gọi API và nhận dữ liệu bài hát từ server
    await Future.delayed(Duration(seconds: 2)); // Giả lập thời gian gọi API
    return Song(
      title: "Bài hát hay",
      artist: "Nghệ sĩ nổi tiếng",
      imageUrl: "https://example.com/album_art.jpg",
      duration: Duration(minutes: 3, seconds: 45),
    );
  }

  void playSong(Song song) {

    print("Đang phát bài hát: ${song.title}");
  }

  void pauseSong() {

    print("Đã tạm dừng bài hát");
  }

  void seekTo(Duration position) {

    print("Di chuyển đến vị trí ${position.inSeconds} giây");
  }
}
