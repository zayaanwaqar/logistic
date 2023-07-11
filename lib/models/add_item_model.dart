class AddItemModel {
  String id;
  final String pickup_location;
  final String dropoff_location;
  final String selectedSize;
  final String noOfLabors;
  final String noOfTrucks;
  final String date;
  final String payment;
  final String email;

  AddItemModel({
    this.id = '',
    required this.pickup_location,
    required this.dropoff_location,
    required this.selectedSize,
    required this.noOfLabors,
    required this.noOfTrucks,
    required this.date,
    required this.payment,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['pickup_location'] = pickup_location;
    data['dropoff_location'] = dropoff_location;
    data['selectedSize'] = selectedSize;
    data['noOfLabors'] = noOfLabors;
    data['noOfTrucks'] = noOfTrucks;
    data['date'] = date;
    data['payment'] = payment;
    data['email'] = email;
    return data;
  }

  static AddItemModel fromJson(Map<String, dynamic> json) => AddItemModel(
    id: json['id'],
    pickup_location: json['pickup_location'],
    dropoff_location: json['dropoff_location'],
    selectedSize: json['selectedSize'],
    noOfLabors: json['noOfLabors'],
    noOfTrucks: json['noOfTrucks'],
    date: json['date'],
    payment: json['payment'],
    email: json['email'],
  );
}
