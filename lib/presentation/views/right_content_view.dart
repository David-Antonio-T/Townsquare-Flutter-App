import 'package:flutter/material.dart';
import 'package:townsquare/presentation/widgets/ads/workshops_ad_widget.dart';
import 'package:townsquare/presentation/widgets/ads/events_ad_widget.dart';
import 'package:townsquare/presentation/widgets/status_points/status_points_widget.dart';

class RightSidebarContent extends StatelessWidget {
  const RightSidebarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      width: 300,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          ProgressCard(),
          SizedBox(height: 16),
          WorkshopsCard(),
          SizedBox(height: 16),
          EventsCard(),
        ],
      ),
    );
  }
}
