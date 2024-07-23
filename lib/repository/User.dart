import 'package:hiremi_version_two/repository/model/userModel.dart';

class UserRepository {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  void setUser(UserModel user) {
    _currentUser = user;
  }
}

final UserRepository userRepository = UserRepository();
