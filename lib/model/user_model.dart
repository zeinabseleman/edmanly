class UserModel {
  String id;
  final String name;
  final String governate;
  final String city;
  final String email;
  final String type;
  final String individualJob;
  final String commercialJob;
  final String onlineMerchantJob;
  final String idImageForward;
  final String idImageBack;
  final String electricityReceipt;
  final String commercialRegister;
  final String taxFile;
  final String profileImage;

  UserModel({
    this.id = '',
    required this.name,
    required this.governate,
    required this.city,
    required this.email,
    required this.type,
    required this.individualJob,
    required this.commercialJob,
    required this.onlineMerchantJob,
    required this.idImageForward,
    required this.idImageBack,
    required this.taxFile,
    required this.commercialRegister,
    required this.electricityReceipt,
    required this.profileImage,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'governate': governate,
        'city': city,
        'email': email,
        'type': type,
        'individualJob': individualJob,
        'commercialJob': commercialJob,
        'onlineMerchantJob': onlineMerchantJob,
        'idImageForward': idImageForward,
        'idImageBack': idImageBack,
        'taxFile': taxFile,
        'commercialRegister': commercialRegister,
        'electricityReceipt': electricityReceipt,
        'profileImage': profileImage
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      name: json['name'],
      governate: json['governate'],
      city: json['city'],
      email: json['email'],
      type: json['type'],
      individualJob: json['individualJob'],
      commercialJob: json['commercialJob'],
      onlineMerchantJob: json['onlineMerchantJob'],
      idImageForward: json['idImageForward'],
      idImageBack: json['idImageBack'],
      taxFile: json['taxFile'],
      commercialRegister: json['commercialRegister'],
      electricityReceipt: json['electricityReceipt'],
      profileImage: json['profileImage']);
}
