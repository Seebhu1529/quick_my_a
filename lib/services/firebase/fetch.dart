import 'package:cloud_firestore/cloud_firestore.dart';


CollectionReference usersData = FirebaseFirestore.instance.collection('users');

Future<void> fatchtUserData(String userName, String password) async {
  usersData.where("userName", isEqualTo: userName).get().then(
    (querySnapshot) {
      print("Successfully completed");
      print(querySnapshot.size);
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}
