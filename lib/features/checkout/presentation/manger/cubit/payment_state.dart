part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {}

final class PaymentError extends PaymentState {
  final String errMessage;

  PaymentError(this.errMessage);
}

final class PaymentChoice extends PaymentState {}