import 'package:flutter/material.dart';
import 'package:jotnaci/colors.dart';
import 'package:jotnaci/components/welcome_header.dart';
import 'package:jotnaci/components/custom_text_field.dart';
import 'package:jotnaci/components/buttons.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String? _selectedItemType;
  int _quantity = 1;
  bool _payerMoi = true;
  String? _paymentType;
  final TextEditingController _recipientNameController =
      TextEditingController();
  final TextEditingController _recipientPhoneController =
      TextEditingController();

  final List<String> _itemTypes = [
    'Gadget',
    'Document',
    'Nourriture',
    'Vêtement',
    'Autre',
  ];

  final List<String> _paymentTypes = [
    'Espèces',
    'Carte bancaire',
    'Mobile Money',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const WelcomeHeader(name: "Détails"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.details_rounded,
              color: AppColors.textSecondary,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Qu'envoyez-vous ?",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Sélectionnez le type d\'article (ex: gadget, document)',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: _selectedItemType,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                hintText: 'Sélectionnez un type',
              ),
              items:
                  _itemTypes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedItemType = newValue;
                });
              },
            ),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            Text(
              'Quantité',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (_quantity > 1) {
                      setState(() {
                        _quantity--;
                      });
                    }
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _quantity.toString(),
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),
            Text(
              'Sélectionnez qui paie',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceChip(
                  label: Text(
                    'Moi',
                    style: GoogleFonts.poppins(
                      color: _payerMoi ? Colors.white : Colors.black,
                    ),
                  ),
                  selected: _payerMoi,
                  onSelected: (selected) {
                    setState(() {
                      _payerMoi = selected;
                    });
                  },
                  selectedColor: AppColors.primaryLightColor,
                  checkmarkColor: Colors.white, // <-- Ajoutez cette ligne
                ),
                const SizedBox(width: 16),
                ChoiceChip(
                  label: Text(
                    'Destinataire',
                    style: GoogleFonts.poppins(
                      color: !_payerMoi ? Colors.white : Colors.black,
                    ),
                  ),
                  selected: !_payerMoi,
                  onSelected: (selected) {
                    setState(() {
                      _payerMoi = !selected;
                    });
                  },
                  selectedColor: AppColors.primaryLightColor,
                  checkmarkColor: Colors.white, // <-- Ajoutez cette ligne
                ),
              ],
            ),

            const SizedBox(height: 24),
            Text(
              'Type de paiement',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: _paymentType,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                hintText: 'Type de paiement',
              ),
              items:
                  _paymentTypes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _paymentType = newValue;
                });
              },
            ),

            const SizedBox(height: 24),
            CustomTextField(
              controller: _recipientNameController,
              labelText: 'Nom du destinataire',
              prefixIcon: Icons.person,
            ),

            const SizedBox(height: 16),
            CustomTextField(
              controller: _recipientPhoneController,
              labelText: 'Numéro de téléphone du destinataire',
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 32),
            Buttons(
              onPress: () {
                if (_selectedItemType == null ||
                    _recipientNameController.text.isEmpty ||
                    _recipientPhoneController.text.isEmpty ||
                    _paymentType == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Veuillez remplir tous les champs obligatoires',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  );
                } else {
                  // Action pour le bouton Continuer
                  // Navigator.push(...);
                }
              },
              text: 'Continuer',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _recipientNameController.dispose();
    _recipientPhoneController.dispose();
    super.dispose();
  }
}
