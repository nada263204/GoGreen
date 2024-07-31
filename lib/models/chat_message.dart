class ChatMessage {
  final String messageContent;
  final String messageType;
  const ChatMessage({
    required this.messageContent,
    required this.messageType,
  });
}

List<ChatMessage> messages = [
  const ChatMessage(
    messageContent: "Hello, Mariam",
    messageType: "receiver",
  ),
  const ChatMessage(
    messageContent: "How have you been?",
    messageType: "receiver",
  ),
  const ChatMessage(
    messageContent: "Hey Mary, I am doing fine dude. wbu?",
    messageType: "sender",
  ),
  const ChatMessage(
    messageContent: "ehhhh, doing OK.",
    messageType: "receiver",
  ),
  const ChatMessage(
    messageContent: "Is there any thing wrong?",
    messageType: "sender",
  ),
  const ChatMessage(
    messageContent: "Good morning, did you recycled it?",
    messageType: "receiver",
  ),
];
