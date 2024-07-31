// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:graduation_project/Widgets/text_scale.dart';
// import 'package:graduation_project/features/community/chat/get_all_users_response.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';

// class ChatDetailsScreen extends StatefulWidget {
//   final Data user;

//   const ChatDetailsScreen({super.key, required this.user});
//   @override
//   _ChatDetailsScreenState createState() => _ChatDetailsScreenState();
// }

// class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
//   final TextEditingController _textEditingController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         title: Text(
//           widget.user.name!,
//           style: TextStyle(
//             fontSize: getResponsiveFontSize(context, fontSize: 18.0),
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('chats/${widget.user.id}/messages')
//                     .orderBy('timestamp', descending: true)
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text('Error: ${snapshot.error}'),
//                     );
//                   }
//                   if (!snapshot.hasData) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   final messages = snapshot.data!.docs;
//                   return ListView.builder(
//                     reverse: true,
//                     itemCount: messages.length,
//                     itemBuilder: (context, index) {
//                       final message = messages[index];
//                       return ChatBubble(
//                         message: message['text'],
//                         timestamp: message['timestamp'].toDate(),
//                         isSentByMe: message['senderId'] ==
//                             widget.user
//                                 .id, // Adjust this based on the message sender
//                         type: message['type'],
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.add),
//                     onPressed: () => _pickImage(),
//                   ),
//                   Expanded(
//                     child: TextField(
//                       controller: _textEditingController,
//                       decoration: const InputDecoration(
//                         hintText: 'Type a message',
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     color: const Color.fromRGBO(200, 230, 201, 1),
//                     icon: const Icon(Icons.send),
//                     onPressed: () => _sendMessage(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _sendMessage() async {
//     final text = _textEditingController.text.trim();
//     if (text.isNotEmpty) {
//       try {
//         await FirebaseFirestore.instance
//             .collection('chats/${widget.user.id}/messages')
//             .add({
//           'text': text,
//           'timestamp': FieldValue.serverTimestamp(),
//           'senderId': widget.user.id,
//           'type': 'text',
//         });
//         _textEditingController.clear();
//       } catch (e) {
//         print('Error sending message: $e');
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Error'),
//               content: const Text('Failed to send message. Please try again.'),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     }
//   }

//   void _pickImage() async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final File imageFile = File(pickedFile.path);
//       await _uploadImage(imageFile);
//     }
//   }

//   Future<void> _uploadImage(File imageFile) async {
//     final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     try {
//       final Reference storageReference =
//           FirebaseStorage.instance.ref().child('chat_images/$fileName');
//       final UploadTask uploadTask = storageReference.putFile(imageFile);
//       final TaskSnapshot taskSnapshot = await uploadTask;
//       final String downloadURL = await taskSnapshot.ref.getDownloadURL();

//       await FirebaseFirestore.instance
//           .collection('chats/${widget.user.id}/messages')
//           .add({
//         'text': downloadURL,
//         'timestamp': FieldValue.serverTimestamp(),
//         'senderId': widget.user.id,
//         'type': 'image',
//       });
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }
// }

// class ChatBubble extends StatelessWidget {
//   final String message;
//   final DateTime timestamp;
//   final bool isSentByMe;
//   final String type;

//   const ChatBubble({
//     required this.message,
//     required this.timestamp,
//     required this.isSentByMe,
//     this.type = 'text', // Default to text type
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Format the timestamp to display only the time
//     final time = DateFormat('HH:mm').format(timestamp);

//     return Align(
//       alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: isSentByMe
//               ? const Color.fromRGBO(200, 230, 201, 1)
//               : Colors.grey[200],
//           borderRadius: BorderRadius.only(
//             topLeft: const Radius.circular(10),
//             topRight: const Radius.circular(10),
//             bottomLeft: isSentByMe
//                 ? const Radius.circular(10)
//                 : const Radius.circular(0),
//             bottomRight: isSentByMe
//                 ? const Radius.circular(0)
//                 : const Radius.circular(10),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment:
//               isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             type == 'image'
//                 ? Image.network(message)
//                 : Text(
//                     message,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//             const SizedBox(height: 5),
//             Text(
//               time,
//               style: const TextStyle(fontSize: 12, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:graduation_project/features/community/chat/get_all_users_response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ChatDetailsScreen extends StatefulWidget {
  final Data user;

  const ChatDetailsScreen({super.key, required this.user});
  @override
  _ChatDetailsScreenState createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          widget.user.name!,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 18.0),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('chats/${widget.user.id}/messages')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final messages = snapshot.data!.docs;
                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return ChatBubble(
                        message: message['text'],
                        timestamp: message['timestamp'].toDate(),
                        isSentByMe: message['senderId'] ==
                            widget.user.id, // Adjust this based on the message sender
                        type: message['type'],
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _pickImage(),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message',
                      ),
                    ),
                  ),
                  IconButton(
                    color: const Color.fromRGBO(200, 230, 201, 1),
                    icon: const Icon(Icons.send),
                    onPressed: () => _sendMessage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    final text = _textEditingController.text.trim();
    if (text.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('chats/${widget.user.id}/messages')
            .add({
          'text': text,
          'timestamp': FieldValue.serverTimestamp(),
          'senderId': widget.user.id,
          'type': 'text',
        });
        _textEditingController.clear();
      } catch (e) {
        print('Error sending message: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Failed to send message. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      await _uploadImage(imageFile);
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      final Reference storageReference =
          FirebaseStorage.instance.ref().child('chat_images/$fileName');
      final UploadTask uploadTask = storageReference.putFile(imageFile);
      final TaskSnapshot taskSnapshot = await uploadTask;
      final String downloadURL = await taskSnapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('chats/${widget.user.id}/messages')
          .add({
        'text': downloadURL,
        'timestamp': FieldValue.serverTimestamp(),
        'senderId': widget.user.id,
        'type': 'image',
      });
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final DateTime timestamp;
  final bool isSentByMe;
  final String type;

  const ChatBubble({
    required this.message,
    required this.timestamp,
    required this.isSentByMe,
    this.type = 'text', // Default to text type
  });

  @override
  Widget build(BuildContext context) {
    // Format the timestamp to display only the time
    final time = DateFormat('HH:mm').format(timestamp);

    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSentByMe
              ? const Color.fromRGBO(200, 230, 201, 1)
              : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
            bottomLeft: isSentByMe
                ? const Radius.circular(10)
                : const Radius.circular(0),
            bottomRight: isSentByMe
                ? const Radius.circular(0)
                : const Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            type == 'image'
                ? Image.network(message)
                : Text(
                    message,
                    style: const TextStyle(fontSize: 16),
                  ),
            const SizedBox(height: 5),
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
