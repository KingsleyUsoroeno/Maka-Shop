class BuyItemResponse {
  final int statusCode;
  final String message;

  BuyItemResponse(this.statusCode, this.message);

  factory BuyItemResponse.fromJson(Map<String, dynamic> map) {
    return BuyItemResponse(map["statusCode"], map["message"]);
  }
}
