import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference usersData = FirebaseFirestore.instance.collection('users');

Future<void> insertUserData(userName, email, password) async {
  // Call the user's CollectionReference to add a new user
  return await usersData
      .add({
        'userName': userName,
        'email': email,
        'password': password,
        'token': usersData.doc().id
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
