import 'package:flutter/material.dart';

class ExpressDeliveryPage extends StatefulWidget {
  const ExpressDeliveryPage({super.key});

  @override
  State<ExpressDeliveryPage> createState() => _ExpressDeliveryPageState();
}

class _ExpressDeliveryPageState extends State<ExpressDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar.new(title: Text('Express Delivery'), centerTitle: true),
    );
  }
}
