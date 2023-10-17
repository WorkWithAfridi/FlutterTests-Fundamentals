import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/unit_test/user_list_app/api_repo/user_repository.dart';
import 'package:flutter_tests/unit_test/user_list_app/model/user_model.dart';

void main() {
  late UserRepository userRepository;

  setUp(() {
    userRepository = UserRepository();
  });

  group("UserRepo", () {
    // if one test fails in a group the entire group test fails.
    group("getUser function", () {
      test(
        "Given: UserRepo Class, When: getUser func. is called. Then: if status code is 200, user model is returned. ",
        () async {
          List<dynamic> listOfUsers = await userRepository.fetchUsers(); // Makes api req to get list of users.
          expect(listOfUsers, isA<List<User>>()); // TO test if the response is actually a list of users
          final user = listOfUsers.first; // Extracts the first user

          expect(
            user,
            isA<User>(), // To check if user is a User Model
          );
        },
      );
      test(
        "Given: UserRepo Class, When: getUser func. is called. Then: if status code is 400, exception is thrown. ",
        () async {
          var listOfUsers = await userRepository.fetchUsers(); // Makes api req to get list of users.

          expect(
            listOfUsers,
            throwsException, // To check if an exception is thrown.
          );
        },
      );
    }); // We can group tests inside group
  }); // To unit test out the User Repository api service class
}
