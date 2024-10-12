import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  User? user = FirebaseAuth.instance.currentUser;

  final CollectionReference<Map<String, dynamic>> postsCollection =
      FirebaseFirestore.instance.collection("Posts");

  Future<void> createPost({required String postMessage}) async {
    await postsCollection.add({
      "email": user?.email,
      'postmessage': postMessage,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getPostsStream() {
    final postsStream =
        postsCollection.orderBy('timestamp', descending: true).snapshots();
    return postsStream;
  }
}
