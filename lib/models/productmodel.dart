class ProductModel {
  final dynamic id;
  final String title;
  final String description;
  final dynamic price;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel(
      {required this.id,
      required this.category,
      required this.description,
      required this.image,
      required this.price,
      required this.rating,
      required this.title});

  factory ProductModel.fromJson(json) {
    return ProductModel(
      rating: RatingModel.fromJson(json["rating"]),
      id: json["id"],
      category: json["category"],
      price: json['price'] == null ? 0.0 : json['price'].toDouble(),
      title: json["title"],
      description: json["description"],
      image: json["image"],
    );
  }
}

class RatingModel {
  final double rate;
  final double count;
  RatingModel({required this.count, required this.rate});
  factory RatingModel.fromJson(json) {
    return RatingModel(
        count: json['count'] == null ? 0.0 : json['count'].toDouble(),
        rate: json['rate'] == null ? 0.0 : json['rate'].toDouble());
  }
}
