import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/ai_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    await FirebaseFirestore.instance.collection('chats').add({
      'text': text.trim(),
      'sender': 'user',
      'timestamp': FieldValue.serverTimestamp(),
    });
    _controller.clear();

    // Show a "typing..." message placeholder
    final typingDoc = await FirebaseFirestore.instance.collection('chats').add({
      'text': '...',
      'sender': 'ai',
      'timestamp': FieldValue.serverTimestamp(),
      'isPlaceholder': true,
    });

    final aiReply = await AIService().sendMessage(text);


    // Replace the placeholder with the real AI response
    await FirebaseFirestore.instance.collection('chats')
        .doc(typingDoc.id)
        .update({
      'text': aiReply,
      'isPlaceholder': false,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Telemedicine Chat')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                final docs = snapshot.data!.docs;
                return ListView(
                  padding: const EdgeInsets.all(8),
                  children: docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final isPlaceholder = data['isPlaceholder'] as bool? ?? false;
                    return Align(
                      alignment: data['sender'] == 'user' ? Alignment.centerRight : Alignment.centerLeft,
                      child: Opacity(
                        opacity: isPlaceholder ? 0.5 : 1.0,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: data['sender'] == 'user' ? Colors.teal.shade100 : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(data['text'] ?? ''),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Type your message...'),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
