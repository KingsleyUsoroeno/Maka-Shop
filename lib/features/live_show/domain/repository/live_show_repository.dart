import 'package:maka_shop/features/live_show/domain/model/show_item.dart';

abstract class LiveShowRepository {
  Future<List<ShowItem>> getAllShowItems(int showId);

  Future<int> buyItem({required int showId, required int itemId});
}
