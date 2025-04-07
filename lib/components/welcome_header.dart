import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotnaci/colors.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
