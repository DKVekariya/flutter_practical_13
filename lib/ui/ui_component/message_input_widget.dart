
import 'package:flutter/material.dart';

import '../../main.dart';

class MessageInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function onSend;

  const MessageInputWidget({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 250), // Limit max height
                  child: SingleChildScrollView(
                    child: TextField(
                      controller: controller,
                      maxLines: null, // Allow the TextField to expand vertically
                      minLines: 1, // Set a minimum number of lines
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.green,
              ),
              onPressed: () {
                onSend();
              },
            ),
          ),
        ],
      ),
    );
  }
}