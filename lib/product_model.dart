class ProductModel {
  String id;
  String title;
  String image;
  String weight;
  int quantity;
  double price;
  bool isFavourite;
  bool isCart;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.weight,
    required this.quantity,
    required this.price,
    required this.isFavourite,
    required this.isCart});
}