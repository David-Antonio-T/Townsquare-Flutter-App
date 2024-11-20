import 'package:flutter/material.dart';
import 'package:townsquare/presentation/widgets/status_points/status_points_widget.dart';
import 'package:townsquare/presentation/widgets/activity_card_widget.dart';
import 'package:townsquare/presentation/view_models/activity_view_model.dart';

class MainContent extends StatelessWidget {
  MainContent({super.key});

  final ActivityViewModel viewModel = ActivityViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildFilters(),
          const SizedBox(height: 8),
          Expanded(child: _buildActivityList(context)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1200;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tues, Nov 12',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const Text(
                'This week in Estepona',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          if (!isDesktop) Icon(Icons.notifications_none),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'What do you feel like doing?',
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
          ),
        ),
      ),
    );
  }

  /// filtros
  Widget _buildFilters() {
    final List<String> filters = [
      'All',
      'Sports',
      'Food',
      'Kids',
      'Creative',
      'Popular',
      'Calm',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          _buildFilterChip(
            label: const Icon(Icons.filter_list_rounded),
            isSelected: false,
          ),
          const SizedBox(width: 8),
          ...filters.map((filter) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _buildFilterChip(
                label: Text(filter),
                isSelected: filter == 'All',
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildFilterChip({required Widget label, required bool isSelected}) {
    return FilterChip(
      label: label,
      selected: isSelected,
      onSelected: (bool selected) {},
      backgroundColor: const Color(0xFFEEE1F5),
      selectedColor: const Color(0xFFEEE1F5),
      checkmarkColor: Colors.black,
      side: BorderSide.none,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Lista de actividades
  Widget _buildActivityList(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1200;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount:
          viewModel.activities.length +
          (isDesktop
              ? 0
              : 1), // +1 para incluir ProgressCard si no es escritorio.
      itemBuilder: (context, index) {
        if (!isDesktop && index == 0) {
          // Agrega ProgressCard como el primer elemento si no es escritorio.
          return const ProgressCard();
        }

        // Ajusta el índice para las actividades si ProgressCard está presente.
        final activityIndex = isDesktop ? index : index - 1;
        return ActivityCard(activity: viewModel.activities[activityIndex]);
      },
    );
  }
}
