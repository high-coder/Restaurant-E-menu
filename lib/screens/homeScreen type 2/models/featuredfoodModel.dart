class FeatureFood {
  final String id;
  final String name;
  final int price;
  final bool wishlist;
  final String rating;
  final String url;
  int quantity;
  bool isFirstTime;

   FeatureFood({
    this.name,
    this.price,
    this.wishlist,
    this.rating,
    this.url,
    this.id,
    this.isFirstTime,
    this.quantity,
  });
}