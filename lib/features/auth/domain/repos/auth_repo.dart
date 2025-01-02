import 'package:effigy/features/auth/domain/entity/user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);

  Future<AppUser?> registerWithEmailPassword(
      String name, String email, String password);

  Future<AppUser?> getCurrentUser();

  Future<void> logout();
}
