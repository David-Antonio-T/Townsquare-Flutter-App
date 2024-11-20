import 'package:flutter/material.dart';
import 'package:townsquare/domain/entities/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({required this.activity, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with Time and Location
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Time and Duration
                RichText(
                  text: TextSpan(
                    text: '${activity.time} ',
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                        text: '(${activity.duration})',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            // Row with Title and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Expanded(
                  child: Text(
                    activity.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Price
                Text(
                  '${activity.price}€',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Location
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  activity.location,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Spots Left, Tags, and Button (aligned)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Spots Left with Background
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${activity.spotsLeft} spots left',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),

                // Tags
                ...activity.tags.map((tag) {
                  final tagColor = _getTagColor(tag);
                  return Container(
                    margin: const EdgeInsets.only(right: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: tagColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: tagColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }),

                const Spacer(),

                // Join/Sold Out Button
                ElevatedButton(
                  onPressed: activity.isSoldOut ? null : () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:
                        activity.isSoldOut ? Colors.grey[300] : Colors.black,
                    foregroundColor:
                        activity.isSoldOut ? Colors.grey[600] : Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    activity.isSoldOut ? 'Sold Out' : 'Join',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Method for Tag Colors
  Color _getTagColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'light':
        return Colors.blue;
      case 'medium':
        return Colors.purple;
      case 'high':
        return Colors.orange;
      case 'childcare':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
