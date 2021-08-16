class Credentials {
  String userName;
  String password;
  Credentials(this.userName, this.password){
    assert(userName.isNotEmpty && password.isNotEmpty);
  }
}

