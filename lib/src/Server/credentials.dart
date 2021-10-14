class Credentials {
  String email;
  String password;
  Credentials(this.email, this.password){
    assert(email.isNotEmpty && password.isNotEmpty);
  }
}

