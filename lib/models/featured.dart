class Featured {
  String image;
  String address;

  Featured.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    address = json['address'];
  }
}