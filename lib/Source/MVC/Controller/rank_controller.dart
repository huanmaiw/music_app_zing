import 'package:get/get.dart';
import 'package:zingmp5/Source/MVC/Model/chart_item_model.dart';

class RankController extends GetxController {
  final chartItems = <ChartItemModel>[
    ChartItemModel(
      rank: 1,
      title: 'Bắc Bling (Bắc Ninh)',
      artist: 'Hòa Minzy, Xuân Hinh, Tuấn Cry',
      asset: 'assets/recommen/rcm1.jpg',
    ),
    ChartItemModel(
      rank: 2,
      title: 'Sorry, Anh Mất Em Rồi!',
      artist: 'Ogenus, Orange',
      asset: 'assets/recommen/rcm2.jpg',
    ),
    ChartItemModel(
      rank: 3,
      title: 'Nước Mắt Cá Sấu',
      artist: 'HIEUTHUHAI',
      asset: 'assets/recommen/rcm3.jpg',
    ),
  ].obs; // <-- Để lỡ có động thay đổi thì GetX update tự động
}
