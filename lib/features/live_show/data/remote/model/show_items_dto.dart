class ShowItemsDto {
  final String itemId;
  final String itemName;
  final int quantitySold;

  ShowItemsDto({
    required this.itemId,
    required this.itemName,
    required this.quantitySold,
  });

  factory ShowItemsDto.fromJson(Map<String, dynamic> map) {
    return ShowItemsDto(
      itemId: map["itemID"],
      itemName: map["itemName"],
      quantitySold: map["quantity_sold"],
    );
  }
}
