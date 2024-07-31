// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/chatbot/ui/chat.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFFF9F9F9), Color(0xFFC0F1C2)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                children: [
                  Lottie.asset('assets/lottie/Animation - 1714594543643.json'),
                  const SizedBox(
                    width: 385,
                    height: 64,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'welcome to your ',
                            style: TextStyle(
                              color: Color(0xFF1A1A1A),
                              fontSize: 32,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Ai Friend',
                            style: TextStyle(
                              color: Color(0xFFA5D6A7),
                              fontSize: 32,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 385,
                    height: 64,
                    child: Text(
                      'Ask any thing, get your answer\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ChatPage(),
                          ));
                    },
                    child: Container(
                      width: 186,
                      height: 61,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFA5D6A7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 53,
                            height: 53,
                            child: Lottie.asset(
                                'assets/lottie/Animation - 1714595942693.json'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'New Chat',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF9F9F9),
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         title: const Text("AI ChatBot", style: TextStyle(fontWeight: FontWeight.bold),),
//       ),
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Card(
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         //get colors from hex
//                         Color(0xFFF69170),
//                         Color(0xFF7D96E6),
//                       ]
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   ),
//                   child: Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(top: 16.0, left: 16.0),
//                             child: (
//                               Text("Hi! You Can Ask Me", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white))
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(left: 16.0),
//                             child: (
//                                 Text("Anything", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white))
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 16.0),
//                             child: (
//                               TextButton(
//                                 onPressed: (){
//                                   Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder: (context) => const ChatPage(),
//                           ),
//                         );
//                                 },
//                                 style: ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                                   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
//                                 ),
//                                 child: const Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                                   child: GradientText(
//                                     "Ask Now",
//                                     style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         Color(0xFFF69170),
//                                         Color(0xFF7D96E6),
//                                       ]
//                                     ),
//                                   ),
//                                 )
//                               )
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 16.0),
//                         child: DecoratedBox(
//                           decoration: BoxDecoration(
//                           image: DecorationImage(image: AssetImage("assets/images/icon.png"), fit: BoxFit.cover),
//                         ),
//                         child: SizedBox(height: 150, width: 150,),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 16.0, left: 16.0),
//                 child: Text("Recent Chats", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
