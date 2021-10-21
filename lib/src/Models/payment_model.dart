class PaymentModel {
  String name;
  int cardNumber;
  DateTime expDate;
  int cvv;

  PaymentModel(this.name, this.cardNumber, this.expDate, this.cvv);
}

class TouristPayment {
  String name;
  String budget;
  String imageUrl;
  String dataPay;
  String destiny;

  TouristPayment(
      this.name, this.budget, this.imageUrl, this.dataPay, this.destiny);
}
