import 'package:flutter/material.dart';
import 'package:flutter_tests/widget_test/user_list_app/api_repo/user_repository.dart';

import 'widget_test/user_list_app/user_list_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserListApp(
        futureUsers: UserRepository().fetchUsers(),
      ),
    );
  }
}
