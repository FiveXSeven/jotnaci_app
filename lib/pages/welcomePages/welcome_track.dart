import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotnaci/colors.dart';
import 'package:jotnaci/components/buttons.dart';
import 'package:jotnaci/pages/authPages/login_page.dart';

class WelcomeTrackPage extends StatefulWidget {
  const WelcomeTrackPage({super.key});

  @override
  State<WelcomeTrackPage> createState() => _WelcomeTrackPageState();
}

class _WelcomeTrackPageState extends State<WelcomeTrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
          child: Column(
            children: [
              Image.asset("assets/logo.png", width: 120),
              SizedBox(height: 50),
              Image.asset(
                "assets/colisLogo.png",
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 50),
              Text(
                "Suivez vos colis",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                "en temps réel",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 50),

              Buttons(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                text: "Commencer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
