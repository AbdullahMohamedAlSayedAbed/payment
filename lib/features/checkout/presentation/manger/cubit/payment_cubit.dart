import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paymentapp/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:paymentapp/features/checkout/data/repos/cheack_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkRepo) : super(PaymentInitial());

  final CheckRepo checkRepo;
  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var response = await checkRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    response.fold((failure) {
      emit(PaymentError(failure.errMessage));
    }, (r) {
      emit(PaymentSuccess());
    });
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
