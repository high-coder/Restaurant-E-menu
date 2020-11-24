class ProductsData {
  final String id;
  final String name;
  final int price;
  String url;
  final int min;
  final int max;
  final List addons;
  final String rating;
  final String description;
  int quantity;
  bool isFirstTime;


  ProductsData({
      this.id,
      this.name,
      this.price,
      this.url,
      this.min,
      this.max,
      this.addons,
      this.description,
      this.rating,
      this.quantity,
      this.isFirstTime,
  });
}
