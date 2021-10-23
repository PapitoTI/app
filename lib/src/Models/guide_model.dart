class GuideModel {
  String imageUrl;
  String name;
  String email;
  String phone;
  String certificate;
  String accountBalance;

  GuideModel(this.imageUrl, this.name, this.email, this.phone, this.certificate,
      this.accountBalance);

  GuideModel clone() => GuideModel(this.imageUrl, this.name, this.email,
      this.phone, this.certificate, this.accountBalance);
}
