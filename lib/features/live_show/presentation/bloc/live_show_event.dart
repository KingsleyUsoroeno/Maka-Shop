part of 'live_show_bloc.dart';

abstract class LiveShowEvent extends Equatable {
  const LiveShowEvent();

  @override
  List<Object?> get props => [];
}

class GetAllShowItemsEvent extends LiveShowEvent {
  final int showId;

  const GetAllShowItemsEvent({this.showId = 222});

  @override
  List<Object?> get props => [showId];
}

class BuyShowItemEvent extends LiveShowEvent {
  final int showId;
  final int itemId;

  const BuyShowItemEvent({this.showId = 222, required this.itemId});

  @override
  List<Object?> get props => [showId, itemId];
}
