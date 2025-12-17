import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static String tokenKey = 'auth_token';
  static String usernameKey = 'username';

  // Simuler une connexion
  Future<bool> login(String username, String password) async {
    // Pour l'exemple, on accepte n'importe quoi
    if (username.isNotEmpty && password.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(tokenKey, 'fake_token_' + username);
      await prefs.setString(usernameKey, username);
      return true;
    }
    return false;
  }

  // Vérifier si connecté
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(tokenKey);
    return token != null;
  }

  // Déconnexion
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
    await prefs.remove(usernameKey);
  }

  // Obtenir le username
  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(usernameKey);
  }
}
