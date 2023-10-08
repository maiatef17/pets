import 'package:flutter/material.dart';
import 'package:pets_app/data/data%20source/pet_local_data_source/pet_local_data_source.dart';
import 'package:pets_app/data/models/pet.dart';
import 'package:pets_app/presentations/widgets/adoption_succeeded_dialog.dart';

class ConfirmAdoptionDialog extends StatefulWidget {
  const ConfirmAdoptionDialog({Key? key, required this.name, required this.pet})
      : super(key: key);
  final String name;
  final Pet pet;

  @override
  State<ConfirmAdoptionDialog> createState() => _ConfirmAdoptionDialogState();
}

class _ConfirmAdoptionDialogState extends State<ConfirmAdoptionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are you sure you want to adopt ${widget.name}?',
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
                      setState(() {
                        PetLocalDSImpl()
                            .togglePetAdopt(widget.pet.id.toString());

                        widget.pet.isAdopt = !widget.pet.isAdopt;
                      });

                      showDialog(
                          context: context,
                          builder: (context) =>
                              AdoptionSucceeded(name: widget.name));
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
