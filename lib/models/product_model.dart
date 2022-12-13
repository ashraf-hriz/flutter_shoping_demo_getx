class Product {
  int? id;
  String? name;
  double? price;
  String? numPeices;
  String? distance;
  bool? favorite;

  Product(
      {this.id,
      this.name,
      this.price,
      this.numPeices,
      this.distance,
      this.favorite});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    numPeices = json['num_peices'];
    distance = json['distance'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['num_peices'] = this.numPeices;
    data['distance'] = this.distance;
    data['favorite'] = this.favorite;
    return data;
  }
}
