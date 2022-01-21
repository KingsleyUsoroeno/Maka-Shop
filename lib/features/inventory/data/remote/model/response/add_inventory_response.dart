class AddInventoryResponse {
  final int statusCode;
  final String message;

  AddInventoryResponse(this.statusCode, this.message);

  factory AddInventoryResponse.fromJson(Map<String, dynamic> map) {
    return AddInventoryResponse(map["statusCode"], map["message"]);
  }
}
