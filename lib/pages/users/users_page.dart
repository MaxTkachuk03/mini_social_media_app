import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media_app/widgets/widgets.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late final Stream<QuerySnapshot<Map<String, dynamic>>> users =
      FirebaseFirestore.instance.collection("Users").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder(
          stream: users,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.data == null) {
              return const Text("No data!");
            }
            final List<QueryDocumentSnapshot<Map<String, dynamic>>>? users =
                snapshot.data?.docs;

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 50.0),
                  child: Row(
                    children: [
                      MyBackButton(),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: users?.length,
                      itemBuilder: (context, index) {
                        final user = users?[index];

                        String message = user?['username'];
                        String userEmail = user?['email'];

                        return MyListTile(
                            message: message, userEmail: userEmail);
                      }),
                ),
              ],
            );
          }),
    );
  }
}
