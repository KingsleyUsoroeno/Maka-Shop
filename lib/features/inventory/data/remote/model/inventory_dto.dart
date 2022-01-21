class InventoryDto {
  final int itemId;
  final String itemName;
  final int quantity;

  InventoryDto({
    required this.itemId,
    required this.itemName,
    required this.quantity,
  });

  factory InventoryDto.fromJson(Map<String, dynamic> json) {
    return InventoryDto(
      itemId: json["itemID"],
      itemName: json["itemName"],
      quantity: json["quantity"],
    );
  }

  Map<String, dynamic> toJson() {
    return {'itemID': itemId, 'itemName': itemName, 'quantity': quantity};
  }
}
