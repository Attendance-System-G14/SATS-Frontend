import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<Map<String, String>> handleGoogleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  return {
    'accessToken': googleAuth.accessToken.toString(),
    'idToken': googleAuth.idToken.toString(),
  };
}

Future<void> handleGoogleSignOut() async {
  await _googleSignIn.signOut();
}