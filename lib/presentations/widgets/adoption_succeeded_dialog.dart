import 'package:flutter/material.dart';

class AdoptionSucceeded extends StatelessWidget {
  const AdoptionSucceeded({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://quilted.io/cdn/shop/products/PetAdoptionIcon_1.png?v=1652144492',
            width: 200,
            height: 200,
          ),
          Text(
            '$name Adopted Successfully',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),
          FilledButton(
              onPressed: () => Navigator.pop(context), child: const Text('OK'))
        ],
      ),
    ));
  }
}
