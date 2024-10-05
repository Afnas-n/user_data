import 'package:flutter/material.dart';
import 'package:user_display/model/user_model.dart';

class UserDetailPage extends StatelessWidget {
  final UserModel user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${user.id}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Year: ${user.year}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Pantone Value: ${user.pantoneValue}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            const Text('Color: ', style: TextStyle(fontSize: 20)),
            Container(
              width: 100,
              height: 50,
              color: Color(int.parse('0xFF${user.color.substring(1)}')),  // Convert hex string to Color
            ),
          ],
        ),
      ),
    );
  }
}
