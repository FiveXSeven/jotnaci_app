import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotnaci/colors.dart';

class Buttons extends StatefulWidget {
  final VoidCallback onPress;
  final String text;
  final Color? bgColor; // Optionnel (par défaut: bleu)
  final Color? textColor; // Optionnel (par défaut: blanc)

  const Buttons({
    super.key,
    required this.onPress,
    required this.text,
    this.bgColor,
    this.textColor,
  });

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        decoration: BoxDecoration(
          color: widget.bgColor ?? AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: widget.textColor ?? AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
