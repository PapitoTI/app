abstract class RegisterServerConnectionInterface {
  Future<void> registerTourist(
      String email, String password, String name) async {
    throw UnsupportedError("");
  }

  Future<int> registerGuide(String email, String password, String name,
      String phone, String certificate) async {
    throw UnsupportedError("");
  }
}
