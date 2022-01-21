import 'package:flutter/material.dart';
import 'package:maka_shop/features/inventory/domain/model/inventory.dart';
import 'package:maka_shop/ui/components/row_text_widget.dart';

class InventoryItemWidget extends StatelessWidget {
  final Inventory inventory;

  const InventoryItemWidget({
    Key? key,
    required this.inventory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          RowTextWidget(
            title: "Product name",
            desc: inventory.name,
          ),
          const SizedBox(
            height: 4.0,
          ),
          RowTextWidget(
            title: "Quantity",
            desc: inventory.quantity.toString(),
          ),
        ],
      ),
    );
  }
}
