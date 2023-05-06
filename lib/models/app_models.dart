class Appointment {
  int? id;
  String? user;
  String? waktu;
  late DateTime tanggal;

  Appointment({this.id, this.user, this.waktu, required this.tanggal});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['user'] = user;
    map['waktu'] = waktu;
    map['tanggal'] = tanggal;

    return map;
  }

  Appointment.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    user = map['user'];
    waktu = map['waktu'];
    tanggal = map['tanggal'];
  }
}
