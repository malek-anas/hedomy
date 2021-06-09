class PrandModel {
  String uid;
  String name;
  String phone;
  String address;
  String image;

  PrandModel({this.uid, this.name, this.address, this.phone, this.image});

  PrandModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
    phone = json['phone'];
    uid = json['uId'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'uId': uid,
      'image': image,
    };
  }
}
