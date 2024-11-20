import 'package:flutter/material.dart';
import 'package:townsquare/presentation/widgets/menu_item_widget.dart';

class LeftSidebarMenu extends StatelessWidget {
  const LeftSidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 55),
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(right: 55),
            child: const Text(
              'TWNSQR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'SFPRODISPLAY',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),
          MenuItem(icon: Icons.calendar_today, label: 'Activities'),
          MenuItem(icon: Icons.location_on_outlined, label: 'Locations'),
          MenuItem(icon: Icons.star_border_outlined, label: 'Services'),
          MenuItem(icon: Icons.people_alt_outlined, label: 'Communities'),
          MenuItem(icon: Icons.notifications_none, label: 'Notifications'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.only(right: 55),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.black),
                label: const Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SFPRODISPLAY',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC1EBFF),
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 45),
                ),
              ),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontFamily: 'SFPRODISPLAY'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
