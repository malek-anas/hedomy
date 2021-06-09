class ShirtModel {
  String name;
  List size;
  String price;
  List images;
  String image;

  // List image;

  ShirtModel({
    this.name,
    this.price,
    this.size,
    this.images,
    this.image,
  });

  ShirtModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    name = json['name'];
    size = json['size'];
    images = json['images'];
    image= json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'size': size,
      'images': images,
      'image': image,
    };
  }
}
