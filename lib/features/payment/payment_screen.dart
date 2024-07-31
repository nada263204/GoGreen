import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/home/nav_bar.dart';
import 'package:graduation_project/features/payment/payment_model.dart';
import 'package:graduation_project/features/payment/payment_states.dart';
import 'payment_cubit.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _cardNumberController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  bool _saveCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
          backgroundColor: const Color.fromARGB(255, 223, 223, 223),
        ),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 223, 223, 223),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double containerHeight = constraints.maxHeight * 1.76 / 3;
              return Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: constraints.maxWidth,
                      height: containerHeight,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          BlocListener<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is PaymentSuccess) {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NavBar()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Payment successful! Transaction ID: ${state.transactionId}')),
                );
              } else if (state is PaymentError) {
                Navigator.of(context, rootNavigator: true).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Payment failed: ${state.message}')),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Card(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('assets/images/card2.png'),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    TextField(
                      controller: _cardNumberController,
                      decoration: const InputDecoration(
                          labelText: 'Credit Card Number'),
                    ),
                    TextField(
                      controller: _cardHolderNameController,
                      decoration:
                          const InputDecoration(labelText: 'Card Holder Name'),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _expiryController,
                            decoration:
                                const InputDecoration(labelText: 'Expiry'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: _cvvController,
                            decoration: const InputDecoration(labelText: 'CVV'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _saveCard,
                          onChanged: (bool? value) {
                            setState(() {
                              _saveCard = value ?? false;
                            });
                          },
                        ),
                        const Text('Save this card for future transactions'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          'TOTAL: 999',
                          style: TextStyle(fontSize: 20),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: _processPayment,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFA5D6A7),
                            foregroundColor: Colors.white,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Receive'),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }

  void _processPayment() {
    final paymentData = PaymentData(
      cardNumber: _cardNumberController.text,
      cardHolderName: _cardHolderNameController.text,
      expiry: _expiryController.text,
      cvv: _cvvController.text,
      saveCard: _saveCard,
    );

    context.read<PaymentCubit>().processPayment(paymentData);
  }
}
