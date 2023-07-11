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
  final String is_accepted;
  final String driverName;
  final String truckNumber;
  final String truckColor;

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
    required this.is_accepted,
    required this.driverName,
    required this.truckNumber,
    required this.truckColor,
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
    data['is_accepted'] = is_accepted;
    data['driverName'] = driverName;
    data['truckNumber'] = truckNumber;
    data['truckColor'] = truckColor;
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
    is_accepted: json['is_accepted'],
    driverName: json['driverName'],
    truckNumber: json['truckNumber'],
    truckColor: json['truckColor'],
  );
}
