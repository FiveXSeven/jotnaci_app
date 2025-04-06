import 'package:flutter/material.dart';

class ScheduleDeliveryPage extends StatefulWidget {
  const ScheduleDeliveryPage({super.key});

  @override
  State<ScheduleDeliveryPage> createState() => _ScheduleDeliveryPageState();
}

class _ScheduleDeliveryPageState extends State<ScheduleDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar.new(title: Text('Schedule Delivery'), centerTitle: true),
    );
  }
}
