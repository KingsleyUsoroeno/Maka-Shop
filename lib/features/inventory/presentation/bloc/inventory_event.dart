part of 'inventory_bloc.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();

  @override
  List<Object?> get props => [];
}

class AddItemsToInventoryEvent extends InventoryEvent {
  final List<Inventory> inventories;

  const AddItemsToInventoryEvent(this.inventories);

  @override
  List<Object?> get props => [inventories];
}
