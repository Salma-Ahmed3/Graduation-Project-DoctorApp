class ProfileModel {
  final String name;
  final String email;
  final String pic;
  final int id;
  final String password;
  final String birthDate;
  final String phoneNumber;
  final String city;
  final String universiry;
  final String location;

  ProfileModel({
    required this.email,
    required this.name,
    required this.pic,
    required this.id,
    required this.password,
    required this.birthDate,
    required this.phoneNumber,
    required this.city,
    required this.universiry,
    required this.location,
  });
  factory ProfileModel.fromjson(json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      pic: json['profilePic'],
      email: json['email'],
      password: json['password'],
      universiry: json['universiry'],
      phoneNumber: json['phoneNumber'],
      birthDate: json['birthDate'],
      city: json['city'],
      location: json['location'],
    );
  }
}
