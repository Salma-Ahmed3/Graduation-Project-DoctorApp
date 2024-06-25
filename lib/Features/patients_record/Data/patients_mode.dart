class PateintsRecord {
  final Diagnosis diagnosis;
  final User user;

  PateintsRecord({required this.diagnosis, required this.user});
  factory PateintsRecord.formJson(diagnosis, user) {
    return PateintsRecord(
        diagnosis: Diagnosis.fromjson(diagnosis), user: User.formJson(user));
  }
}

class Diagnosis {
  final int id;
  final String mainDisease;
  final String note;
  final String datatime;

  Diagnosis(
      {required this.id,
      required this.mainDisease,
      required this.note,
      required this.datatime});
  factory Diagnosis.fromjson(json) {
    return Diagnosis(
        id: json['id'],
        mainDisease: json['summaryOfTheSession'],
        note: json['mainDiseases'],
        datatime: json['datetime']);
  }
}

class User {
  final int id;
  final String pic;
  final String name;
  final String phone;

  User(
      {required this.id,
      required this.pic,
      required this.name,
      required this.phone});
  factory User.formJson(json) {
    return User(
        id: json['id'],
        pic: json['profilePic'],
        name: json['name'],
        phone: json['phoneNumber']);
  }
}
