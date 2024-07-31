import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/payment/payment_model.dart';
import 'package:graduation_project/features/payment/payment_states.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  void processPayment(PaymentData paymentData) async {
    emit(PaymentLoading());

    await Future.delayed(const Duration(seconds: 2));

    bool isSuccess = paymentData.cardNumber == "4242424242424242";
    if (isSuccess) {
      emit(const PaymentSuccess("txn_123456"));
    } else {
      emit(const PaymentError("Invalid card details"));
    }
  }
}
