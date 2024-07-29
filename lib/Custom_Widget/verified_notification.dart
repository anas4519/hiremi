import 'package:flutter/material.dart';

class VerifiedNotification extends StatelessWidget {
  final VoidCallback onClose;

  const VerifiedNotification({required this.onClose, super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      height: screenHeight * 0.1,
      width: screenWidth,
      decoration: BoxDecoration(
        color: const Color(0xFFE1F3EB),
        borderRadius: BorderRadius.circular(screenWidth * 0.01),
        border: Border.all(color: const Color(0xFF34AD78)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFF34AD78),
            radius: 25,
            child: Icon(Icons.edit_document, color: Colors.white),
          ),
          SizedBox(width: screenWidth * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Hey, Your Account is Verified.', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: screenHeight * 0.005),
              const Text('Now, you have access to explore Hiremi App\nIndependently.', style: TextStyle(fontSize: 9.62, color: Colors.grey)),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close, size: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
