import 'package:maka_shop/features/inventory/data/remote/inventory_api_service.dart';
import 'package:maka_shop/features/inventory/data/remote/model/inventory_dto.dart';
import 'package:maka_shop/features/inventory/domain/model/inventory.dart';
import 'package:maka_shop/features/inventory/domain/repository/inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryApiService inventoryApiService;

  InventoryRepositoryImpl(this.inventoryApiService);

  @override
  Future<int> addItemToInventory(List<Inventory> inventories) async {
    final inventoryDto = inventories
        .map((e) =>
            InventoryDto(itemId: e.id, itemName: e.name, quantity: e.quantity))
        .toList();

    final response = await inventoryApiService.addInventoryItems(inventoryDto);
    return response.statusCode;
  }
}
