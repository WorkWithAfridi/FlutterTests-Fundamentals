import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/unit_test/user_list_app/api_repo/user_repository.dart';
import 'package:flutter_tests/unit_test/user_list_app/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

// Here we're mocking the http.client class using mocktail sdk, to replicate the client class
// So that we can better replicate the http calls and have more control over it.
class MockHTTPClient extends Mock implements http.Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    // userRepository = UserRepository(http.Client()); // for http.client

    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient); // for custom client class
  });

  group("UserRepo", () {
    // if one test fails in a group the entire group test fails.
    group("getUser function", () {
      test(
        "Given: UserRepo Class, When: getUser func. is called. Then: if status code is 200, user model is returned. ",
        () async {
          when(
            () => mockHTTPClient.get(
              Uri.parse(
                'https://jsonplaceholder.typicode.com/users',
              ),
            ),
          ).thenAnswer((invocation) async {
            return http.Response(
              """
[
  {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  },
  {
    "id": 2,
    "name": "Ervin Howell",
    "username": "Antonette",
    "email": "Shanna@melissa.tv",
    "address": {
      "street": "Victor Plains",
      "suite": "Suite 879",
      "city": "Wisokyburgh",
      "zipcode": "90566-7771",
      "geo": {
        "lat": "-43.9509",
        "lng": "-34.4618"
      }
    },
    "phone": "010-692-6593 x09125",
    "website": "anastasia.net",
    "company": {
      "name": "Deckow-Crist",
      "catchPhrase": "Proactive didactic contingency",
      "bs": "synergize scalable supply-chains"
    }
  }
]
""", // Json file
              200, // Custom status code
            ); // Now we have full control over the api requests and their status code as well.
          });
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
          when(
            () => mockHTTPClient.get(
              Uri.parse(
                'https://jsonplaceholder.typicode.com/users',
              ),
            ),
          ).thenAnswer((invocation) async {
            return http.Response(
              "{}",
              500, // Custom status code // 500 internal server error
            ); // Now we have full control over the api requests and their status code as well.
          });
          var listOfUsers = userRepository.fetchUsers(); // Makes api req to get list of users.

          expect(
            listOfUsers,
            throwsException, // To check if an exception is thrown.
          );
        },
      );
    }); // We can group tests inside group
  }); // To unit test out the User Repository api service class
}
