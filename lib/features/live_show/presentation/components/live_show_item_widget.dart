import 'package:flutter/material.dart';
import 'package:maka_shop/features/live_show/domain/model/show_item.dart';
import 'package:maka_shop/ui/components/custom_button.dart';
import 'package:maka_shop/ui/components/row_text_widget.dart';

class LiveShowItemWidget extends StatelessWidget {
  final ShowItem showItem;
  final VoidCallback? onPress;

  const LiveShowItemWidget({
    Key? key,
    required this.showItem,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          RowTextWidget(
            title: "ItemName",
            desc: showItem.itemName,
          ),
          const SizedBox(
            height: 6.0,
          ),
          RowTextWidget(
            title: "Quantity Sold",
            desc: showItem.quantitySold.toString(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomButton(
              width: 100.0,
              height: 30.0,
              label: "Buy item",
              onPress: onPress,
            ),
          )
        ],
      ),
    );
  }
}
