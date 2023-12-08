// ignore_for_file: non_constant_identifier_names

class RoomModel {
  String? image;
  String? descryption;
  String? date;
  String? price;
 

  RoomModel({
    required this.image,
    required this.descryption,
    required this.date,
    required this.price,
   
  });

  RoomModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    descryption = json['descryption'];
    date = json['date'];
    price = json['price'];

    // selectedStartingDate = json['selectedStartingDate'].toDate();

 
  }

  Map<String, dynamic> tomap() {
    return {
      'image': image,
      'descryption': descryption,
      'date': date,
      'price': price,
  
    };
  }
}
