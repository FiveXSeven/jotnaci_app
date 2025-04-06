import 'package:flutter/material.dart';

class SocialAuthButtons extends StatelessWidget {
  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;
  final VoidCallback? onApplePressed;

  const SocialAuthButtons({
    super.key,
    this.onGooglePressed,
    this.onFacebookPressed,
    this.onApplePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset("assets/google.png", width: 40),
          onPressed: onGooglePressed,
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: Image.asset("assets/facebook.png", width: 40),
          onPressed: onFacebookPressed,
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: Image.asset("assets/apple.png", width: 40),
          onPressed: onApplePressed,
        ),
      ],
    );
  }
}
