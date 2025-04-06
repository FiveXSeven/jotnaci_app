import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotnaci/colors.dart';
import 'package:jotnaci/components/delivery_option_card.dart';
import 'package:jotnaci/components/recent_shipment_card.dart';
import 'package:jotnaci/components/welcome_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedDeliveryOption = 0; // 0 = Express, 1 = Programmée

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const WelcomeHeader(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: AppColors.textSecondary,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: AppColors.textSecondary,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Que souhaitez-vous faire ?',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),

            // Options de livraison
            Row(
              children: [
                Expanded(
                  child: DeliveryOptionCard(
                    icon: Icons.rocket_launch_rounded,
                    title: 'Livraison Express',
                    color: AppColors.primaryLightColor,
                    isSelected: selectedDeliveryOption == 0,
                    onTap: () {
                      setState(() {
                        selectedDeliveryOption = 0;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DeliveryOptionCard(
                    icon: Icons.calendar_today_rounded,
                    title: 'Livraison Programmée',
                    color: AppColors.secondaryColor,
                    isSelected: selectedDeliveryOption == 1,
                    onTap: () {
                      setState(() {
                        selectedDeliveryOption = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Section Historique
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Historique',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Voir tout',
                    style: GoogleFonts.poppins(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Liste des envois récents
            const RecentShipmentCard(
              trackingNumber: 'ORDB1234',
              recipient: 'Paul Pogba',
              address: 'Arrêt de bus Maryland, Anthony Ikeja',
              date: '12 janvier 2024, 14:43',
              status: 'Livré',
            ),
            const SizedBox(height: 12),
            const RecentShipmentCard(
              trackingNumber: 'ORDB5678',
              recipient: 'Alex Morgan',
              address: '25 Rue de la Paix, Paris',
              date: '10 janvier 2024, 10:15',
              status: 'En cours',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historique',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
