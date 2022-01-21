part of 'live_show_bloc.dart';

abstract class LiveShowState extends Equatable {
  const LiveShowState();

  @override
  List<Object> get props => [];
}

class LiveShowInitial extends LiveShowState {}

class GetShowItemsLoadingState extends LiveShowState {}

class GetShowItemsSuccessState extends LiveShowState {
  final List<ShowItem> showItems;

  const GetShowItemsSuccessState(this.showItems);

  @override
  List<Object> get props => [showItems];
}

class GetShowItemsErrorState extends LiveShowState {
  final String errorMessage;

  const GetShowItemsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class BuyShowItemsLoadingState extends LiveShowState {
  final List<ShowItem> showItems;

  const BuyShowItemsLoadingState(this.showItems);

  @override
  List<Object> get props => [showItems];
}

class BuyShowItemsSuccessState extends LiveShowState {}

class BuyShowItemsErrorState extends LiveShowState {
  final String errorMessage;
  final List<ShowItem> showItems;

  const BuyShowItemsErrorState({
    required this.errorMessage,
    required this.showItems,
  });

  @override
  List<Object> get props => [errorMessage];
}
