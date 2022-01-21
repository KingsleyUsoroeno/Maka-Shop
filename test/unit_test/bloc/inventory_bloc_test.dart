import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maka_shop/features/inventory/domain/model/inventory.dart';
import 'package:maka_shop/features/inventory/domain/repository/inventory_repository.dart';
import 'package:maka_shop/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'inventory_bloc_test.mocks.dart';

@GenerateMocks([InventoryRepository])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final inventoryRepository = MockInventoryRepository();

  final List<Inventory> inventories = [
    Inventory(id: 0, name: "name", quantity: 9),
    Inventory(id: 1, name: "Papa", quantity: 9),
  ];

  blocTest(
    'emits [AddItemToInventoryLoadingState(), '
    'AddItemToInventorySuccessState()] when adding items to '
    'inventory completed successfully',
    build: () {
      when(inventoryRepository.addItemToInventory(inventories)).thenAnswer(
        (_) async => 201,
      );
      return InventoryBloc(inventoryRepository);
    },
    act: (InventoryBloc bloc) {
      bloc.add(AddItemsToInventoryEvent(inventories));
    },
    expect: () => [
      AddItemToInventoryLoadingState(),
      AddItemToInventorySuccessState(),
    ],
  );

  blocTest(
    'emits [AddItemToInventoryLoadingState(), AddItemToInventoryErrorState()] '
    'when adding items to inventory throws an exception',
    build: () {
      when(inventoryRepository.addItemToInventory([]))
          .thenThrow(Exception("Something went wrong"));
      return InventoryBloc(inventoryRepository);
    },
    act: (InventoryBloc bloc) {
      bloc.add(const AddItemsToInventoryEvent([]));
    },
    expect: () => [
      AddItemToInventoryLoadingState(),
      const AddItemToInventoryErrorState("Exception: Something went wrong")
    ],
  );
}
