import 'package:maka_shop/features/inventory/domain/model/inventory.dart';

abstract class InventoryRepository {
  Future<int> addItemToInventory(List<Inventory> inventories);
}
