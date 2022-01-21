import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maka_shop/core/util/app_utils.dart';
import 'package:maka_shop/features/live_show/domain/model/show_item.dart';
import 'package:maka_shop/features/live_show/presentation/bloc/live_show_bloc.dart';
import 'package:maka_shop/features/live_show/presentation/components/live_show_item_widget.dart';
import 'package:maka_shop/injection_container.dart';
import 'package:maka_shop/ui/components/snackbar.dart';

class LiveShowScreen extends StatefulWidget {
  const LiveShowScreen({Key? key}) : super(key: key);

  @override
  State<LiveShowScreen> createState() => _LiveShowScreenState();
}

class _LiveShowScreenState extends State<LiveShowScreen>
    with AutomaticKeepAliveClientMixin {
  final liveShowBloc = injector.get<LiveShowBloc>()
    ..add(const GetAllShowItemsEvent());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<LiveShowBloc, LiveShowState>(
      bloc: liveShowBloc,
      listener: (context, viewState) {
        if (viewState is BuyShowItemsLoadingState) {
          AppUtils.showAnimationProgressDialog(context);
        } else if (viewState is BuyShowItemsSuccessState) {
          Navigator.of(context).pop();
          liveShowBloc.add(const GetAllShowItemsEvent());
        } else if (viewState is BuyShowItemsErrorState) {
          Navigator.of(context).pop();
          CustomSnackBar.error(context, viewState.errorMessage);
        }
      },
      builder: (context, viewState) {
        if (viewState is GetShowItemsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewState is GetShowItemsSuccessState) {
          return _showItems(viewState.showItems);
        } else if (viewState is GetShowItemsErrorState) {
          return const Center(
            child: Text("Something went wrong"),
          );
        } else if (viewState is BuyShowItemsLoadingState) {
          return _showItems(viewState.showItems);
        } else if (viewState is BuyShowItemsErrorState) {
          return _showItems(viewState.showItems);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _showItems(List<ShowItem> showItems) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
      itemCount: showItems.length,
      itemBuilder: (_, int index) {
        final showItem = showItems[index];
        return LiveShowItemWidget(
          showItem: showItem,
          onPress: () {
            liveShowBloc.add(BuyShowItemEvent(itemId: showItem.itemId));
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
