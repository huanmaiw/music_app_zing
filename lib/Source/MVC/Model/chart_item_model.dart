class ChartItemModel {
  final String title;
  final String artist;
  final String asset;
  final String audioUrl; // <-- thêm dòng này

  ChartItemModel({
    required this.title,
    required this.artist,
    required this.asset,
    required this.audioUrl,
  });
}
