import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maka_shop/core/exception/server_exception.dart';
import 'package:maka_shop/features/live_show/domain/model/show_item.dart';
import 'package:maka_shop/features/live_show/domain/repository/live_show_repository.dart';

part 'live_show_event.dart';

part 'live_show_state.dart';

class LiveShowBloc extends Bloc<LiveShowEvent, LiveShowState> {
  final LiveShowRepository liveShowRepository;
  final List<ShowItem> showItems = [];

  LiveShowBloc(this.liveShowRepository) : super(LiveShowInitial()) {
    on<GetAllShowItemsEvent>(_getShowItems);
    on<BuyShowItemEvent>(_buyShowItems);
  }

  Future<void> _getShowItems(
      GetAllShowItemsEvent event, Emitter<LiveShowState> emit) async {
    emit(GetShowItemsLoadingState());
    try {
      final result = await liveShowRepository.getAllShowItems(event.showId);
      showItems.clear();
      showItems.addAll(result);
      emit(GetShowItemsSuccessState(result));
    } on ServerException catch (e) {
      emit(GetShowItemsErrorState(e.message));
    } catch (e) {
      emit(GetShowItemsErrorState(e.toString()));
    }
  }

  Future<void> _buyShowItems(
      BuyShowItemEvent event, Emitter<LiveShowState> emit) async {
    emit(BuyShowItemsLoadingState(showItems));
    try {
      await liveShowRepository.buyItem(
          itemId: event.itemId, showId: event.showId);
      emit(BuyShowItemsSuccessState());
    } on ServerException catch (e) {
      emit(BuyShowItemsErrorState(
          errorMessage: e.message, showItems: showItems));
    } catch (e) {
      emit(BuyShowItemsErrorState(
          errorMessage: e.toString(), showItems: showItems));
    }
  }
}
