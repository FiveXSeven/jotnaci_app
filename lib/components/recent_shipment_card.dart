import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentShipmentCard extends StatelessWidget {
  final String trackingNumber;
  final String recipient;
  final String address;
  final String date;
  final String status;

  const RecentShipmentCard({
    super.key,
    required this.trackingNumber,
    required this.recipient,
    required this.address,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trackingNumber,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        status == 'Livré' ? Colors.green[50] : Colors.blue[50],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: GoogleFonts.poppins(
                      color:
                          status == 'Livré'
                              ? Colors.green[800]
                              : Colors.blue[800],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Destinataire: $recipient',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 16),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    address,
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(date, style: GoogleFonts.poppins(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
