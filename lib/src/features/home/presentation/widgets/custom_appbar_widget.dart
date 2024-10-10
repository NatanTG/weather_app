import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String city;

  const CustomAppbarWidget({super.key, required this.city});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF08244F),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                city,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () {},
              ),
            ],
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
