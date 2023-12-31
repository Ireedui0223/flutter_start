class Product {
  int id;
  String name;
  double price;
  String image;

  String get imageUrl =>
      "https://firtman.github.io/coffeemasters/api/images/$image";

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        name: json['name'] as String,
        price: json['price'] as double,
        image: json['image'] as String);
  }
}

class Category {
  String name;
  List<Product> product;

  Category({required this.name, required this.product});

  factory Category.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as Iterable<dynamic>;
    var products = productsJson.map((e) => Product.fromJson(e)).toList();
    return Category(name: json['name'] as String, product: products);
  }
}

class ItemInCart {
  Product product;
  int quantity;

  ItemInCart({required this.product, required this.quantity});
}
