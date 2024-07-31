import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

class ChatPage extends StatefulWidget {
  static const routeName = '/chat';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // final TextEditingController _chatController = TextEditingController();
  // final ScrollController _scrollController = ScrollController();
  // final List<Map<String, dynamic>> _chatHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size(double.infinity, MediaQuery.sizeOf(context).height * 0.17),
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.17,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/chat_header.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
        ),
        body: const HomePage()
        // Stack(
        //   children: [
        //     SizedBox(
        //       //get max height
        //       height: MediaQuery.of(context).size.height - 160,
        //       child: ListView.builder(
        //         itemCount: _chatHistory.length,
        //         shrinkWrap: false,
        //         controller: _scrollController,
        //         padding: const EdgeInsets.only(top: 10, bottom: 10),
        //         physics: const BouncingScrollPhysics(),
        //         itemBuilder: (context, index) {
        //           return Container(
        //             padding: const EdgeInsets.only(
        //               left: 14,
        //               right: 14,
        //               top: 10,
        //               bottom: 10,
        //             ),
        //             child: Align(
        //               alignment: _chatHistory[index]["isSender"]
        //                   ? Alignment.topRight
        //                   : Alignment.topLeft,
        //               child: Row(
        //                 mainAxisSize: MainAxisSize.min,
        //                 // crossAxisAlignment: CrossAxisAlignment.end,
        //                 children: [
        //                   if (!_chatHistory[index]["isSender"]) ...[
        //                     CircleAvatar(
        //                       radius: 24.0,
        //                       backgroundImage: AssetImage(
        //                         _chatHistory[index]["isSender"]
        //                             ? 'assets/images/ahmed.png'
        //                             : 'assets/images/ai.png',
        //                       ),
        //                     ),
        //                     const SizedBox(width: 10.0),
        //                   ],
        //                   Column(
        //                     mainAxisSize: MainAxisSize.min,
        //                     crossAxisAlignment: _chatHistory[index]["isSender"]
        //                         ? CrossAxisAlignment.end
        //                         : CrossAxisAlignment.start,
        //                     children: [
        //                       Container(
        //                         constraints: BoxConstraints(
        //                           maxWidth:
        //                               MediaQuery.sizeOf(context).width * 0.75,
        //                         ),
        //                         decoration: BoxDecoration(
        //                           borderRadius: const BorderRadius.vertical(
        //                             top: Radius.circular(30.0),
        //                           ).copyWith(
        //                             bottomRight: !_chatHistory[index]["isSender"]
        //                                 ? const Radius.circular(30.0)
        //                                 : null,
        //                             bottomLeft: _chatHistory[index]["isSender"]
        //                                 ? const Radius.circular(30.0)
        //                                 : null,
        //                           ),
        //                           // boxShadow: [
        //                           //   BoxShadow(
        //                           //     color: Colors.grey.withOpacity(0.5),
        //                           //     spreadRadius: 2,
        //                           //     blurRadius: 5,
        //                           //     offset: const Offset(0, 3),
        //                           //   ),
        //                           // ],
        //                           color: _chatHistory[index]["isSender"]
        //                               ? const Color(0xFFA5D6A7)
        //                               : const Color(0xffA5D6A7).withOpacity(0.6),
        //                         ),
        //                         padding: const EdgeInsets.all(16),
        //                         child: Text(
        //                           _chatHistory[index]["message"],
        //                           style: TextStyle(
        //                             fontSize: 15,
        //                             color: _chatHistory[index]["isSender"]
        //                                 ? Colors.white
        //                                 : Colors.black,
        //                           ),
        //                           textAlign: _chatHistory[index]["isSender"]
        //                               ? TextAlign.end
        //                               : TextAlign.start,
        //                         ),
        //                       ),
        //                       const Text(
        //                         '10AM',
        //                         style: TextStyle(fontSize: 10.0),
        //                       ),
        //                     ],
        //                   ),
        //                   if (_chatHistory[index]["isSender"]) ...[
        //                     const SizedBox(width: 10.0),
        //                     CircleAvatar(
        //                       radius: 24.0,
        //                       backgroundImage: AssetImage(
        //                         _chatHistory[index]["isSender"]
        //                             ? 'assets/images/ahmed.png'
        //                             : 'assets/images/ai.png',
        //                       ),
        //                     ),
        //                   ],
        //                 ],
        //               ),
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Align(
        //         alignment: Alignment.bottomCenter,
        //         child: Container(
        //           padding: const EdgeInsets.all(8.0),
        //           margin: const EdgeInsets.all(10.0),
        //           height: 60,
        //           width: double.infinity,
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(50.0),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Colors.grey.withOpacity(0.5),
        //                 spreadRadius: 2,
        //                 blurRadius: 5,
        //                 offset: const Offset(0, 3),
        //               ),
        //             ],
        //           ),
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               IconButton(
        //                 onPressed: () {},
        //                 icon: const Icon(
        //                   Icons.emoji_emotions,
        //                   size: 30.0,
        //                   color: Colors.grey,
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 4.0,
        //               ),
        //               Expanded(
        //                 child: TextFormField(
        //                   controller: _chatController,
        //                   keyboardType: TextInputType.multiline,
        //                   maxLines: null,
        //                   decoration: const InputDecoration(
        //                     contentPadding: EdgeInsets.zero,
        //                     hintText: 'Type message here...',
        //                     border: OutlineInputBorder(
        //                       borderSide: BorderSide.none,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 4.0,
        //               ),
        //               FloatingActionButton(
        //                 onPressed: () {
        //                   setState(() {
        //                     if (_chatController.text.isNotEmpty) {
        //                       _chatHistory.add({
        //                         "time": DateTime.now(),
        //                         "message": _chatController.text,
        //                         "isSender": true,
        //                       });
        //                       _chatController.clear();
        //                     }
        //                   });
        //                   _scrollController.jumpTo(
        //                     _scrollController.position.maxScrollExtent,
        //                   );

        //                   getAnswer();
        //                 },
        //                 mini: true,
        //                 shape: const CircleBorder(),
        //                 backgroundColor: const Color(0xffA5D6A7),
        //                 child: const Icon(
        //                   Icons.send,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        );
  }

  // void getAnswer() async {
  //   const url =
  //       "https://generativelanguage.googleapis.com/v1beta2/models/chat-bison-001:generateMessage?key=<INSERT API KEY>";

  //   List<Map<String, String>> msg = [];
  //   for (var i = 0; i < _chatHistory.length; i++) {
  //     msg.add({"content": _chatHistory[i]["message"]});
  //   }

  //   Map<String, dynamic> request = {
  //     "prompt": {
  //       "messages": [msg]
  //     },
  //     "temperature": 0.25,
  //     "candidateCount": 1,
  //     "topP": 1,
  //     "topK": 1
  //   };

  //   try {
  //     // Create Dio instance
  //     Dio dio = Dio();
  //     // Make POST request
  //     Response response = await dio.post(url, data: request);

  //     // Handle response
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         _chatHistory.add({
  //           "time": DateTime.now(),
  //           "message": response.data["candidates"][0]["content"],
  //           "isSender": false,
  //         });
  //       });

  //       _scrollController.jumpTo(
  //         _scrollController.position.maxScrollExtent,
  //       );
  //     } else {
  //       // Handle error
  //       print("Request failed with status: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print("Error: $e");
  //   }
  // }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "GoGreen",
    profileImage: "assets/images/chatbot.png",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      inputOptions: InputOptions(trailing: [
        IconButton(
          onPressed: _sendMediaMessage,
          icon: const Icon(
            Icons.image,
          ),
        )
      ]),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessage(chatMessage);
    }
  }
}
