class GetProductResponse {
  List<Product> data;

  GetProductResponse({required this.data});

  factory GetProductResponse.fromJson(Map<String, dynamic> json) {
    return GetProductResponse(
        data: List<Product>.from(
            json['data'].map((product) => Product.fromJson(product))));
  }
}

class Product {
  int id;
  String category;
  String title;
  String description;
  int price;
  String texture;
  String wash;
  String place;
  String note;
  String story;
  String mainImage;
  List<String> images;
  List<Variant> variants;
  List<Color> colors;
  List<String> sizes;

  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.mainImage,
    required this.images,
    required this.variants,
    required this.colors,
    required this.sizes,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      texture: json['texture'],
      wash: json['wash'],
      place: json['place'],
      note: json['note'],
      story: json['story'],
      mainImage: json['main_image'],
      images: List<String>.from(json['images']),
      variants: List<Variant>.from(
        json['variants'].map(
          (variant) => Variant.fromJson(variant),
        ),
      ),
      colors: List<Color>.from(
        json['colors'].map(
          (color) => Color.fromJson(color),
        ),
      ),
      sizes: List<String>.from(json['sizes']),
    );
  }
}

class Variant {
  String colorCode;
  String size;
  int stock;

  Variant({
    required this.colorCode,
    required this.size,
    required this.stock,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      colorCode: json['color_code'],
      size: json['size'],
      stock: json['stock'],
    );
  }
}

class Color {
  String code;
  String name;

  Color({
    required this.code,
    required this.name,
  });

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      code: json['code'],
      name: json['name'],
    );
  }
}
