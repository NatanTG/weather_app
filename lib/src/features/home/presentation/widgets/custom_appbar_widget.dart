import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String city;

  const CustomAppbarWidget({super.key, required this.city});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              city,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: () {},
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
