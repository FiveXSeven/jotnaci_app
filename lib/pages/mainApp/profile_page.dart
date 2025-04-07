import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotnaci/colors.dart';
import 'package:jotnaci/components/profile_header.dart';
import 'package:jotnaci/components/profile_option_card.dart';
import 'package:jotnaci/components/welcome_header.dart';
import 'package:jotnaci/components/custom_text_field.dart'; // Importez votre composant

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const WelcomeHeader(name: "Votre profil"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.textSecondary,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const ProfileHeader(
              name: 'Nazaire Salomon SAGNA',
              email: 'nazaire@example.com',
            ),
            ProfileOptionCard(
              icon: Icons.lock_outline,
              title: 'Changer le mot de passe',
              onTap: () => _showChangePasswordDialog(context),
            ),
            const Divider(height: 1),
            ProfileOptionCard(
              icon: Icons.logout,
              title: 'Déconnexion',
              onTap: () => _showLogoutConfirmation(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              'Changer le mot de passe',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: currentPasswordController,
                  labelText: 'Mot de passe actuel',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: newPasswordController,
                  labelText: 'Nouveau mot de passe',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: confirmPasswordController,
                  labelText: 'Confirmer le nouveau mot de passe',
                  prefixIcon: Icons.lock_reset,
                  obscureText: true,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Annuler'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  // Validation des champs
                  if (newPasswordController.text !=
                      confirmPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Les mots de passe ne correspondent pas'),
                      ),
                    );
                    return;
                  }

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Mot de passe changé avec succès'),
                    ),
                  );
                },
                child: const Text(
                  'Confirmer',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Déconnexion'),
            content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Annuler'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Déconnexion réussie')),
                  );
                  // Ajoutez ici votre logique de déconnexion
                },
                child: const Text(
                  'Déconnexion',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }
}
