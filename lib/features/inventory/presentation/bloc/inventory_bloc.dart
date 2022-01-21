import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maka_shop/core/exception/server_exception.dart';
import 'package:maka_shop/features/inventory/domain/model/inventory.dart';
import 'package:maka_shop/features/inventory/domain/repository/inventory_repository.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final InventoryRepository inventoryRepository;

  InventoryBloc(this.inventoryRepository) : super(InventoryInitial()) {
    on<AddItemsToInventoryEvent>(_addItemsToInventory);
  }

  Future<void> _addItemsToInventory(
      AddItemsToInventoryEvent event, Emitter<InventoryState> emit) async {
    emit(AddItemToInventoryLoadingState());
    try {
      await inventoryRepository.addItemToInventory(event.inventories);
      emit(AddItemToInventorySuccessState());
    } on ServerException catch (e) {
      emit(AddItemToInventoryErrorState(e.message));
    } catch (e) {
      emit(AddItemToInventoryErrorState(e.toString()));
    }
  }
}
