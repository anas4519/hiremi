import 'package:hiremi_version_two/Models/register_model.dart';

class UserRepository {
  User? _currentUser;

  User? get currentUser => _currentUser;

  void setUser(User user) {
    _currentUser = user;
  }
}

final UserRepository userRepository = UserRepository();
