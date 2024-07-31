class PaymentData {
  final String cardNumber;
  final String cardHolderName;
  final String expiry;
  final String cvv;
  final bool saveCard;

  PaymentData({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiry,
    required this.cvv,
    required this.saveCard,
  });
}
