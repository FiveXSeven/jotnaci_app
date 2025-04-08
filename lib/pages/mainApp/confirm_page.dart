import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotnaci/colors.dart';
import 'package:jotnaci/components/welcome_header.dart';
import 'package:jotnaci/components/buttons.dart';
import 'package:jotnaci/pages/mainApp/home_page.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const WelcomeHeader(name: "Confirmation"),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Type de livraison
                    _buildSectionTitle("Type de livraison"),
                    _buildDeliveryTypeCard(
                      type: "Express",
                      icon: Icons.rocket_launch_rounded,
                      details: "Livraison dans 2 heures",
                    ),

                    const SizedBox(height: 24),

                    // Section Détails du colis
                    _buildSectionTitle("Détails du colis"),
                    _buildDetailItem("Type d'article", "Gadget"),
                    _buildDetailItem("Quantité", "2"),
                    _buildDetailItem("Paiement", "Moi (Mobile Money)"),

                    const SizedBox(height: 24),

                    // Section Adresses
                    _buildSectionTitle("Adresses"),
                    _buildAddressCard(
                      title: "Lieu de départ",
                      address: "123 Rue de la Paix, Abidjan",
                      icon: Icons.location_on,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(height: 12),
                    _buildAddressCard(
                      title: "Lieu d'arrivée",
                      address: "456 Avenue des Banques, Cocody",
                      icon: Icons.flag,
                      color: Colors.green,
                    ),

                    const SizedBox(height: 24),

                    // Section Véhicule
                    _buildSectionTitle("Véhicule"),
                    _buildVehicleCard(
                      type: "Voiture",
                      icon: Icons.directions_car,
                      distance: "7 km",
                      estimatedTime: "15-20 min",
                    ),

                    const SizedBox(height: 24),

                    // Section Récapitulatif prix
                    _buildPriceSummary(),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),

            // Bouton fixe en bas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Buttons(
                onPress: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Commande confirmée!',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                text: 'Confirmer la livraison',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildDeliveryTypeCard({
    required String type,
    required IconData icon,
    required String details,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40, color: AppColors.primaryColor),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Livraison $type",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  details,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard({
    required String title,
    required String address,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 24, color: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              address,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleCard({
    required String type,
    required IconData icon,
    required String distance,
    required String estimatedTime,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 30, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Véhicule: $type",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Distance: $distance • Temps estimé: $estimatedTime",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceSummary() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildPriceItem("Frais de livraison", "2 500 FCFA"),
            const Divider(height: 24),
            _buildPriceItem("Frais de service", "500 FCFA"),
            const Divider(height: 24),
            _buildPriceItem("Total", "3 000 FCFA", isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceItem(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
            color: isTotal ? AppColors.primaryColor : Colors.grey.shade700,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: isTotal ? AppColors.primaryColor : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
