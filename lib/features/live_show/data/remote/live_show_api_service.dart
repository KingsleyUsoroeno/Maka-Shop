import 'package:maka_shop/core/util/api_helper.dart';
import 'package:maka_shop/features/live_show/data/remote/model/response/buy_item_response.dart';
import 'package:maka_shop/features/live_show/data/remote/model/show_items_dto.dart';

class LiveShowApiService {
  final ApiBaseHelper apiHelper;

  LiveShowApiService(this.apiHelper);

  Future<List<ShowItemsDto>> getAllShowItems(int showId) async {
    final result = await apiHelper.get("show/$showId");
    return List.from(result.data).map((e) => ShowItemsDto.fromJson(e)).toList();
  }

  Future<BuyItemResponse> buyItem({
    int showId = 222,
    required int itemId,
  }) async {
    final result = await apiHelper.post("show/$showId/buy_item/$itemId");
    return BuyItemResponse.fromJson(result.data);
  }
}
