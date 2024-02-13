import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passma_time/features/calenderpage/data/repo/calender_repo.dart';

class CalenderRepoImpl implements CalenderRepo{
  @override
 Stream<QuerySnapshot>?lisenchange(String id) {
  
 return FirebaseFirestore.instance
                  .collection('user')
                  .doc(id)
                  .collection('record')
                  .snapshots();
  }





}