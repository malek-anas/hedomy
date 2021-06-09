class UserModel {
  String uid;
  String name;
  String phone;
  String email;
  String image;

  UserModel({this.uid, this.name, this.email, this.phone, this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uid = json['uId'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uid,
      'image': image,
    };
  }
}
