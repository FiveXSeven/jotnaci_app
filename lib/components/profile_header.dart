// components/profile_header.dart
import 'package:flutter/material.dart';
import 'package:jotnaci/colors.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.imageUrl = 'https://randomuser.me/api/portraits/men/41.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 50, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(height: 16),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          email,
          style: TextStyle(fontSize: 18, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
