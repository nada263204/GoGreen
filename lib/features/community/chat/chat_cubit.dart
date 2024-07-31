import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/features/community/chat/chat_states.dart';

class ChatCubit extends Cubit<ChatState> {
  final FirebaseFirestore _firestore;
  final String chatId;

  ChatCubit(this._firestore, this.chatId) : super(ChatInitial());

  void sendMessage(String senderId, String text) {
    if (text.isEmpty) return;

    final message = ChatMessage(
      id: '',
      senderId: senderId,
      text: text,
      timestamp: Timestamp.now(),
    );

    _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toFirestore());
  }

  void listenToMessages() {
    _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .listen((snapshot) {
      final messages =
          snapshot.docs.map((doc) => ChatMessage.fromFirestore(doc)).toList();
      emit(ChatLoaded(messages));
    });
  }
}
