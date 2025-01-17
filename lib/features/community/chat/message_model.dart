// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatMessage {
//   final String id;
//   final String senderId;
//   final String text;
//   final Timestamp timestamp;

//   ChatMessage({
//     required this.id,
//     required this.senderId,
//     required this.text,
//     required this.timestamp,
//   });

//   // Factory constructor to create a ChatMessage from Firestore document
//   factory ChatMessage.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return ChatMessage(
//       id: doc.id,
//       senderId: data['senderId'],
//       text: data['text'],
//       timestamp: data['timestamp'],
//     );
//   }

//   // Method to convert a ChatMessage to Firestore format
//   Map<String, dynamic> toFirestore() {
//     return {
//       'senderId': senderId,
//       'text': text,
//       'timestamp': timestamp,
//     };
//   }
// }
