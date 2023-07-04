import 'package:gotraining/modules/login/model/login_model.dart';

class AuthService {
  final List<UserModel> mockUsers = [
    UserModel(email: 'henrique', password: '123', name: 'Henrique '),
    UserModel(email: 'felipe', password: '654321', name: 'Felipe'),
    UserModel(email: 'user3@test.com', password: 'qwerty', name: 'Teste'),
  ];

  Future<UserModel> login(String email, String password) async {
    final user = mockUsers.firstWhere(
      (user) => user.email == email && user.password == password,
    );
    return user;
  }
}
