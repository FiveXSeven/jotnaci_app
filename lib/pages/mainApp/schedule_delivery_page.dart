import 'package:flutter/material.dart';
import 'package:jotnaci/colors.dart';
import 'package:jotnaci/components/welcome_header.dart';

class ScheduleDeliveryPage extends StatefulWidget {
  const ScheduleDeliveryPage({super.key});

  @override
  State<ScheduleDeliveryPage> createState() => _ScheduleDeliveryPageState();
}

class _ScheduleDeliveryPageState extends State<ScheduleDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const WelcomeHeader(name: "Livraison programée"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.calendar_today_rounded,
              color: AppColors.textSecondary,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
    );
  }
}
