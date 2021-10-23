class PaymentModel {
  String name;
  int cardNumber;
  DateTime expDate;
  int cvv;

  PaymentModel(this.name, this.cardNumber, this.expDate, this.cvv);

  PaymentModel.from(PaymentModel p)
      : name = p.name,
        cardNumber = p.cardNumber,
        expDate = p.expDate,
        cvv = p.cvv;
}

class TouristPayment {
  String name;
  String budget;
  String imageUrl;
  String dataPay;
  String destiny;

  TouristPayment(
      this.name, this.budget, this.imageUrl, this.dataPay, this.destiny);

  TouristPayment.from(TouristPayment t)
      : name = t.name,
        budget = t.budget,
        imageUrl = t.imageUrl,
        dataPay = t.dataPay,
        destiny = t.destiny;
}
