abstract class RegisterServerConnectionInterface {
  Future<int> registerTourist(
      String email, String password, String name, String phone) async {
    throw UnsupportedError("");
  }

  Future<int> registerGuide(String email, String password, String name,
      String phone, String certificate) async {
    throw UnsupportedError("");
  }
}
