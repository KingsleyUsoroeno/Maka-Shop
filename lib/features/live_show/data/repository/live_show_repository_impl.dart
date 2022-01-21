import 'package:maka_shop/features/live_show/data/remote/live_show_api_service.dart';
import 'package:maka_shop/features/live_show/domain/model/show_item.dart';
import 'package:maka_shop/features/live_show/domain/repository/live_show_repository.dart';

class LiveShowRepositoryImpl implements LiveShowRepository {
  final LiveShowApiService apiService;

  LiveShowRepositoryImpl(this.apiService);

  @override
  Future<int> buyItem({required int showId, required int itemId}) async {
    final result = await apiService.buyItem(itemId: itemId);
    return result.statusCode;
  }

  @override
  Future<List<ShowItem>> getAllShowItems(int showId) async {
    final showItems = await apiService.getAllShowItems(showId);
    return showItems
        .map((e) => ShowItem(
            itemId: int.parse(e.itemId),
            itemName: e.itemName,
            quantitySold: e.quantitySold))
        .toList();
  }
}
