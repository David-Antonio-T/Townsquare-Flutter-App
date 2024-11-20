import 'package:flutter/material.dart';
import 'package:townsquare/presentation/views/left_menu_view.dart';
import 'package:townsquare/presentation/views/main_content_view.dart';
import 'package:townsquare/presentation/views/right_content_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // responsive
    bool isDesktop = MediaQuery.of(context).size.width >= 1200;

    return Scaffold(
      body: Row(
        children: [
          // Primera columna - Menú lateral (solo visible en desktop)
          if (isDesktop) Expanded(flex: 2, child: LeftSidebarMenu()),

          // Segunda columna - Contenido principal (siempre visible)
          Expanded(flex: 6, child: MainContent()),

          // Tercera columna - Widgets informativos (solo visible en desktop)
          if (isDesktop) Expanded(flex: 3, child: RightSidebarContent()),
        ],
      ),

      bottomNavigationBar:
          isDesktop
              ? null
              : BottomNavigationBar(
                backgroundColor: Colors.black,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  const BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.calendar_today, color: Colors.black),
                    label: 'Activities',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.location_on_outlined, color: Colors.black),
                    label: 'Locations',
                  ),
                  BottomNavigationBarItem(
                    //Create Button
                    icon: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFC1EBFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                    label: 'Add',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.star_outline, color: Colors.black),
                    label: 'Services',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.people_outline, color: Colors.black),
                    label: 'Communities',
                  ),
                ],
              ),
    );
  }
}
