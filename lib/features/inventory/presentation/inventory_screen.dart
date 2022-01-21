import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maka_shop/core/util/app_utils.dart';
import 'package:maka_shop/features/inventory/domain/model/inventory.dart';
import 'package:maka_shop/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:maka_shop/features/inventory/presentation/component/inventory_item_widget.dart';
import 'package:maka_shop/injection_container.dart';
import 'package:maka_shop/ui/components/custom_button.dart';
import 'package:maka_shop/ui/components/custom_text_input.dart';
import 'package:maka_shop/ui/components/snackbar.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen>
    with AutomaticKeepAliveClientMixin {
  final _quantityTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _inventoryBloc = injector.get<InventoryBloc>();
  final int id = Random().nextInt(100);

  final List<Inventory> _inventories = [];

  void _onSave() {
    if (_inventories.isNotEmpty) {
      _inventoryBloc.add(AddItemsToInventoryEvent(_inventories));
    } else {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.validate();
        final String name = _nameTextController.text.trim();
        final int quantity = int.parse(_quantityTextController.text.trim());
        _inventories.add(Inventory(id: id, name: name, quantity: quantity));
        _quantityTextController.clear();
        _nameTextController.clear();
        _inventoryBloc.add(AddItemsToInventoryEvent(_inventories));
      }
    }
  }

  void _onAddMore() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.validate();
      final String name = _nameTextController.text.trim();
      final int quantity = int.parse(_quantityTextController.text.trim());
      _inventories.add(Inventory(id: id, name: name, quantity: quantity));
      _quantityTextController.clear();
      _nameTextController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<InventoryBloc, InventoryState>(
      bloc: _inventoryBloc,
      listener: (context, viewState) {
        if (viewState is AddItemToInventoryLoadingState) {
          AppUtils.showAnimationProgressDialog(context);
        } else if (viewState is AddItemToInventorySuccessState) {
          Navigator.of(context).pop();
          setState(() => _inventories.clear());
          CustomSnackBar.show(context, "Items added to inventory",
              backgroundColor: Colors.green);
        } else if (viewState is AddItemToInventoryErrorState) {
          Navigator.of(context).pop();
          CustomSnackBar.error(context, viewState.errorMessage);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_inventories.isNotEmpty)
                Expanded(
                  child: AnimatedOpacity(
                    opacity: _inventories.isEmpty ? 0 : 1,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    child: ListView.builder(
                      itemCount: _inventories.length,
                      itemBuilder: (_, int index) {
                        return InventoryItemWidget(
                          inventory: _inventories[index],
                        );
                      },
                    ),
                  ),
                ),
              CustomTextField(
                labelText: "Product name",
                controller: _nameTextController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              CustomTextField(
                labelText: "Quantity",
                controller: _quantityTextController,
                keyboardType: TextInputType.number,
                textInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        label: 'Save',
                        onPress: _onSave,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: CustomButton(
                        label: 'Add More',
                        onPress: _onAddMore,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
