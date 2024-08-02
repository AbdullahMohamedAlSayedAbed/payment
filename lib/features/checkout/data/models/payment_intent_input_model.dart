class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  const PaymentIntentInputModel(
      {required this.amount, required this.currency, required this.customerId});

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerId,
    };
  }
}
