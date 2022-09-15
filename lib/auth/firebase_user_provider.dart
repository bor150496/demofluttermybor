import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MyBORFirebaseUser {
  MyBORFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MyBORFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MyBORFirebaseUser> myBORFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<MyBORFirebaseUser>((user) => currentUser = MyBORFirebaseUser(user));
