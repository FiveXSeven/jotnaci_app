import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotnaci/colors.dart';
import 'package:jotnaci/components/delivery_option_card.dart';
import 'package:jotnaci/components/recent_shipment_card.dart';
import 'package:jotnaci/components/welcome_header.dart';
import 'package:jotnaci/pages/mainApp/express_delivery_page.dart';
import 'package:jotnaci/pages/mainApp/history_page.dart';
import 'package:jotnaci/pages/mainApp/notification_page.dart';
import 'package:jotnaci/pages/mainApp/profile_page.dart';
import 'package:jotnaci/pages/mainApp/schedule_delivery_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const _HomeContent(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentIndex == 0 ? Colors.grey[50] : Colors.white,
      appBar:
          _currentIndex == 0
              ? AppBar(
                automaticallyImplyLeading: false,
                title: const WelcomeHeader(name: "Nazaire Salomon"),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.person_outline,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () => _pageController.jumpToPage(2),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.textSecondary,
                    ),
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage(),
                          ),
                        ),
                  ),
                ],
                backgroundColor: AppColors.backgroundColor,
                elevation: 0,
              )
              : null,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        color: AppColors.primaryColor,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Center(child: Icon(Icons.home_filled, size: 30, color: Colors.white)),
          Center(
            child: Icon(Icons.history_rounded, size: 30, color: Colors.white),
          ),
          Center(
            child: Icon(Icons.person_2_rounded, size: 30, color: Colors.white),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Row(
            children: [
              Expanded(
                child: DeliveryOptionCard(
                  icon: Icons.rocket_launch_rounded,
                  title: 'Livraison Express',
                  color: AppColors.primaryLightColor,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExpressDeliveryPage(),
                        ),
                      ),
                ),
              ),
              const SizedBox(width: 16), // Ligne 124 corrigée
              Expanded(
                child: DeliveryOptionCard(
                  icon: Icons.calendar_today_rounded,
                  title: 'Livraison Programmée',
                  color: AppColors.secondaryColor,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScheduleDeliveryPage(),
                        ),
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
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
                onPressed: () {
                  final homeState =
                      context.findAncestorStateOfType<_HomePageState>();
                  homeState?._pageController.jumpToPage(1);
                },
                child: Text(
                  'Voir tout',
                  style: GoogleFonts.poppins(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
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
    );
  }
}
