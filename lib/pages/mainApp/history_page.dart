import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotnaci/colors.dart';
import 'package:jotnaci/components/recent_shipment_card.dart';
import 'package:jotnaci/components/welcome_header.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const WelcomeHeader(name: "Historique"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.history_rounded,
              color: AppColors.textSecondary,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Votre historique de livraisons',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
              const SizedBox(height: 12),
              const RecentShipmentCard(
                trackingNumber: 'ORDB5678',
                recipient: 'Alex Morgan',
                address: '25 Rue de la Paix, Paris',
                date: '10 janvier 2024, 10:15',
                status: 'En cours',
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
      ),
    );
  }
}
