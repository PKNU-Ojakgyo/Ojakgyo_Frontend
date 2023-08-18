class AuthTokenGet {
  static String? authToken;

  static void setToken(String token) {
    authToken = token;
  }

  static void removeToken() {
    authToken = null;
  }

  static bool isLoggedIn() {
    return authToken != null;
  }
}
