import 'package:flutter/material.dart';
import 'package:jotnaci/colors.dart';
import 'package:jotnaci/components/welcome_header.dart';
import 'package:jotnaci/components/custom_text_field.dart';
import 'package:jotnaci/components/buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotnaci/pages/mainApp/details_page.dart';

class ExpressDeliveryPage extends StatefulWidget {
  const ExpressDeliveryPage({super.key});

  @override
  State<ExpressDeliveryPage> createState() => _ExpressDeliveryPageState();
}

class _ExpressDeliveryPageState extends State<ExpressDeliveryPage> {
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();
  String? _selectedVehicle;
  String _distance = '0 km';
  bool _showDistance = false;

  final List<Map<String, dynamic>> _vehicleOptions = [
    {'type': 'Moto', 'icon': Icons.motorcycle},
    {'type': 'Voiture', 'icon': Icons.directions_car},
    {'type': 'Camion', 'icon': Icons.local_shipping},
  ];

  void _calculateDistance() {
    if (_pickupController.text.isNotEmpty &&
        _deliveryController.text.isNotEmpty) {
      setState(() {
        _distance = '${(5 + (DateTime.now().second % 10)).toString()} km';
        _showDistance = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const WelcomeHeader(name: "Livraison express"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.rocket_launch_rounded,
              color: AppColors.textSecondary,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Carte en haut
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.map, size: 50, color: Colors.grey),
                    const SizedBox(height: 8),
                    Text(
                      'Carte des lieux de livraison',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Formulaire en bas
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    controller: _pickupController,
                    labelText: 'Lieu de départ',
                    prefixIcon: Icons.location_on,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _deliveryController,
                    labelText: 'Lieu d\'arrivée',
                    prefixIcon: Icons.location_on,
                    suffixIcon: Icons.search,
                    onSuffixIconPressed: _calculateDistance,
                  ),

                  if (_showDistance) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Distance: $_distance',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),
                  Text(
                    'Type de véhicule:',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Nouveau design pour les options de véhicule
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        _vehicleOptions.map((vehicle) {
                          final isSelected =
                              _selectedVehicle == vehicle['type'];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedVehicle =
                                    isSelected ? null : vehicle['type'];
                              });
                            },
                            child: Container(
                              width: 100,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? AppColors.primaryLightColor
                                        : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? AppColors.primaryColor
                                          : Colors.grey.shade300,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    vehicle['icon'],
                                    size: 30,
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.grey.shade700,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    vehicle['type'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          isSelected
                                              ? Colors.white
                                              : Colors.grey.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),

                  const SizedBox(height: 32),
                  Buttons(
                    onPress: () {
                      if (_pickupController.text.isEmpty ||
                          _deliveryController.text.isEmpty ||
                          _selectedVehicle == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Veuillez remplir tous les champs',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        );
                      } else {
                        // Action pour le bouton Suivant
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailsPage(),
                          ),
                        );
                      }
                    },
                    text: 'Suivant',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pickupController.dispose();
    _deliveryController.dispose();
    super.dispose();
  }
}
