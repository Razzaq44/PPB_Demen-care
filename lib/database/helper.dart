import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBase {
  String? name;
  var dokterList = [];
  var needApprove = [];
  var approved = [];
  var approvedP = [];
  var pasienList = [];

  Future<void> getUsn() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();
    name = userDoc.get('username');
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
}
