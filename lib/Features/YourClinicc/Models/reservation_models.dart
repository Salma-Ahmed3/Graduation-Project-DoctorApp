class ReservationModels {
  final int id;
  final int doctorid;
  final int userid;
  final int timeid;
  final String year;
  final String month;
  final String day;
  final String appointmentTime;
  final String pic;
  final String name;
  final String number;
  final String spec;
  final int fee;
  final String unviersity;
  final bool rated;

  const ReservationModels({
    required this.id,
    required this.doctorid,
    required this.userid,
    required this.timeid,
    required this.year,
    required this.month,
    required this.day,
    required this.appointmentTime,
    required this.pic,
    required this.name,
    required this.number,
    required this.spec,
    required this.fee,
    required this.unviersity,
    required this.rated,
  });

  factory ReservationModels.json(json) {
    return ReservationModels(
      id: json['id'],
      doctorid: json['doctorid'],
      userid: json['userid'],
      timeid: json['timeid'],
      year: json['year'],
      month: json['month'],
      day: json['day'],
      appointmentTime: json['appointmentTime'],
      pic: json['pic'],
      name: json['name'],
      number: json['number'],
      spec: json['spec'] ?? "",
      fee: json['fee'] ?? 0,
      unviersity: json['unviersity'] ?? "",
      rated: json['rated'],
    );
  }
}
