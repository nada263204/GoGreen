import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:graduation_project/Screens/home/nav_bar.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> with TickerProviderStateMixin {
  late final GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'Do you like Go green?',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    'Rate your expirience',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Gif(
                    image: const AssetImage("assets/lottie/rate.gif"),
                    controller: _controller,
                    autostart: Autostart.loop,
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    fit: BoxFit.cover,
                    duration: const Duration(milliseconds: 1500),
                    placeholder: (context) => const CircularProgressIndicator(),
                    onFetchCompleted: () {
                      _controller.reset();
                      _controller.forward();
                    },
                  ),
                  const Text(
                    'Your Ideas are always Welcome',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      hintText:
                          'have an idea for a new feature, push to publish it or vote on existing ones',
                    ),
                    maxLines: 5,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavBar(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff28F2B2),
                        minimumSize:
                            Size(MediaQuery.sizeOf(context).width * 0.7, 50.0)),
                    child: const Text(
                      'Submit',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
