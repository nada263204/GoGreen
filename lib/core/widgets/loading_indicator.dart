import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xFFA5D6A7),
      ),
    );
  }
}
