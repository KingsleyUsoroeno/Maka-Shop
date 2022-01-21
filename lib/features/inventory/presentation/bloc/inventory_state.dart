part of 'inventory_bloc.dart';

abstract class InventoryState extends Equatable {
  const InventoryState();

  @override
  List<Object> get props => [];
}

class InventoryInitial extends InventoryState {}

class AddItemToInventoryLoadingState extends InventoryState {}

class AddItemToInventorySuccessState extends InventoryState {}

class AddItemToInventoryErrorState extends InventoryState {
  final String errorMessage;

  const AddItemToInventoryErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
