import 'package:effigy/features/auth/domain/entity/user.dart';
import 'package:effigy/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = auth.currentUser;

    if (firebaseUser == null) {
      return null;
    }

    return AppUser(
      email: firebaseUser.email!,
      name: '',
      uid: firebaseUser.uid,
    );
  }

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential creds = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppUser currentUser =
          AppUser(email: email, name: '', uid: creds.user!.uid);
      return currentUser;
    } catch (error) {
      throw Exception('login failed - $error');
    }
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }

  @override
  Future<AppUser?> registerWithEmailPassword(
      String name, String email, String password) async {
    try {
      UserCredential creds = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      AppUser newUser = AppUser(
        email: email,
        name: name,
        uid: creds.user!.uid,
      );

      return newUser;
    } catch (error) {
      throw Exception('Error signing up - $error');
    }
  }
}
