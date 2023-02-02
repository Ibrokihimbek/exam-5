import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const NotificationItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 110,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(6, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Container(
        padding: const EdgeInsets.all(1),
        child: Row(
          children: [
            Image.network(
              imagePath,
              width: 70,
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
