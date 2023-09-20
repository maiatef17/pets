import 'package:flutter/material.dart';
import 'package:pets_app/presentations/widgets/adoption_succeeded_dialog.dart';

class ConfirmAdoptionDialog extends StatelessWidget {
  const ConfirmAdoptionDialog({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are you sure you want to adopt $name?',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) => AdoptionSucceeded(name: name));
                    },
                    child: const Text('Yes')),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('No')),
              )
            ],
          )
        ],
      ),
    ));
  }
}
