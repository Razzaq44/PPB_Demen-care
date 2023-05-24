import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBase {
  String? name;
  String? role;
  var dokterList = [];
  var pasienList = [];
  var needApprove = [];
  var approved = [];
  var approvedP = [];
  var diagnosisDList = [];
  var resepObatList = [];
  var diagnosisList = [];
  var menu = [];

  Future<void> getUsn() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();
    name = userDoc.get('username');
    role = userDoc.get('role');
  }

  Future<void> getDokterName() async {
    List<Map<String, dynamic>> newDataList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'Dokter')
        .get();
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      newDataList.add({'username': data['username']});
    });
    dokterList = newDataList;
  }

  Future<void> getPasienName() async {
    List<Map<String, dynamic>> newDataList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'Pasien')
        .get();
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      newDataList.add({'username': data['username']});
    });
    pasienList = newDataList;
  }

  Stream<void> getNeedApprove(String? dokter) {
    return FirebaseFirestore.instance
        .collection('appointment')
        .where('dokter', isEqualTo: dokter)
        .where('approved', isEqualTo: 'pending')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> newDataList = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newDataList.add({
          'approved': data['approved'],
          'dokter': data['dokter'],
          'hari': data['hari'],
          'tanggal': data['tanggal'],
          'pasien': data['pasien'],
          'waktu': data['waktu']
        });
      });
      needApprove = newDataList;
    });
  }

  Stream<void> getApproved(String? dokter) {
    return FirebaseFirestore.instance
        .collection('appointment')
        .where('dokter', isEqualTo: dokter)
        .where('approved', isEqualTo: 'approve')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> newDataList = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newDataList.add({
          'approved': data['approved'],
          'dokter': data['dokter'],
          'hari': data['hari'],
          'tanggal': data['tanggal'],
          'pasien': data['pasien'],
          'waktu': data['waktu']
        });
      });
      approved = newDataList;
    });
  }

  Stream<void> getApprovedP(String? pasien) {
    return FirebaseFirestore.instance
        .collection('appointment')
        .where('pasien', isEqualTo: pasien)
        .where('approved', isEqualTo: 'approve')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> newDataList = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newDataList.add({
          'approved': data['approved'],
          'dokter': data['dokter'],
          'hari': data['hari'],
          'tanggal': data['tanggal'],
          'pasien': data['pasien'],
          'waktu': data['waktu']
        });
      });
      approvedP = newDataList;
    });
  }

  Stream<void> getDiagnosisD(String? dokter) {
    return FirebaseFirestore.instance
        .collection('diagnosis')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> newDataList = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newDataList.add({
          'datadiagnosis': data['datadiagnosis'],
          'hari': data['hari'],
          'dokter': data['dokter'],
          'tanggal': data['tanggal'],
          'pasien': data['pasien'],
        });
      });
      diagnosisDList = newDataList;
    });
  }

  Stream<void> getDiagnosis(String? pasien) {
    return FirebaseFirestore.instance
        .collection('diagnosis')
        .where('pasien', isEqualTo: pasien)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> newDataList = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newDataList.add({
          'datadiagnosis': data['datadiagnosis'],
          'hari': data['hari'],
          'dokter': data['dokter'],
          'tanggal': data['tanggal'],
          'pasien': data['pasien'],
        });
      });
      diagnosisDList = newDataList;
    });
  }

  Stream<void> getresepObat(String? pasien) {
    return FirebaseFirestore.instance
        .collection('resepobat')
        .where('pasien', isEqualTo: pasien)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> newDataList = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newDataList.add({
          'dokter': data['dokter'],
          'namaobat': data['namaobat'],
          'note': data['note'],
          'pasien': data['pasien'],
          'rules': data['rules'],
        });
      });
      resepObatList = newDataList;
    });
  }

  Future<void> getMenu(String? role) async {
    List<Map<String, dynamic>> newDataList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('homepage')
        .where('role', isEqualTo: role)
        .get();
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      newDataList.add({
        'title': data['title'],
        'desc': data['desc'],
        'image': data['image'],
        'page': data['page'],
        'role': data['role'],
      });
    });
    menu = newDataList;
  }
}
