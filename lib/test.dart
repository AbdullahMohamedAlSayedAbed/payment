// void main() async {
//   Stripe.publishableKey = stripePublishableKey;
//   runApp(const App());
// }
// //create payment intent(amount, currency, customerId,)
// // init Payment Sheet(paymentIntentClientSecret)
// // presentPaymentSheet()
// Future<void> initPaymentSheet() async {
//   try {
//     // 1. create payment intent on the server
//     // final data = await _createTestPaymentSheet();

//     // 2. initialize the payment sheet
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         // Set to true for custom flow
//         // customFlow: false,

//         // Main params
//         merchantDisplayName: 'Flutter Stripe Store Demo',
//         paymentIntentClientSecret: data['paymentIntent'],
//         // Customer keys
//         // customerEphemeralKeySecret: data['ephemeralKey'],
//         // customerId: data['customer'],

//         // Extra options
//         // applePay: const PaymentSheetApplePay(
//         //   merchantCountryCode: 'US',
//         // ),
//         // googlePay: const PaymentSheetGooglePay(
//         //   merchantCountryCode: 'US',
//         //   testEnv: true,
//         // ),
//         // style: ThemeMode.dark,
//       ),
//     );
//     setState(() {
//       _ready = true;
//     });
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error: $e')),
//     );
//     rethrow;
//   }
// }
// await Stripe.instance.presentPaymentSheet();

// await Stripe.instance.confirmPaymentSheetPayment();
