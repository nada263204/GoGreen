import 'package:flutter/material.dart';

class success_screen extends StatelessWidget {
  const success_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const Text('Successful!'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA5D6A7),
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Done'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
