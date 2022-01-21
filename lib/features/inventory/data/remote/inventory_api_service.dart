import 'dart:convert';

import 'package:maka_shop/core/util/api_helper.dart';
import 'package:maka_shop/features/inventory/data/remote/model/response/add_inventory_response.dart';

import 'model/inventory_dto.dart';

class InventoryApiService {
  final ApiBaseHelper apiHelper;

  InventoryApiService(this.apiHelper);

  Future<AddInventoryResponse> addInventoryItems(
      List<InventoryDto> inventories) async {
    final result =
        await apiHelper.post("inventory", data: jsonEncode(inventories));
    return AddInventoryResponse.fromJson(result.data);
  }
}
