import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pool/services/funcations/auth_funcations.dart';

saveDecsion(Map pollsWeight, String title) async {
  await FirebaseFirestore.instance.collection('decision').add(
    {
      'pollWeights': pollsWeight,
      'uid': currUser!.uid,
      'usersWhoVoted': {},
      'title': title
    },
  );
}
