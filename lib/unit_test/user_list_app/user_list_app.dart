import 'package:flutter/material.dart';

import 'api_repo/user_repository.dart';
import 'model/user_model.dart';

class UserListAppWidgetTest extends StatefulWidget {
  final Future<List<User>> futureUsers;
  const UserListAppWidgetTest({
    super.key,
    required this.futureUsers,
  });

  @override
  State<UserListAppWidgetTest> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<UserListAppWidgetTest> {
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: FutureBuilder<List<User>>(
        future: widget.futureUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
