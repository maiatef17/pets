import 'package:flutter/material.dart';
import 'package:pets_app/data/models/pet.dart';
import 'package:pets_app/presentations/widgets/dialog.dart';

class PetInfoPage extends StatelessWidget {
  const PetInfoPage({Key? key, required this.pet}) : super(key: key);
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'ID # ${pet.id} ${pet.name}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: GridTile(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(30)),
                child: Image.asset('${pet.imageurl}',
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ${pet.id}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurple),
                  ),
                  Text(
                    'Name: ${pet.name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurple),
                  ),
                  SizedBox(height: 8),
                  Text('TIPS:'),
                  Text('Spend Time With Them Before You Bring Them Home.'),
                  Text('Set Up a Space Just For Them.'),
                  Text('Pet Proof Your Home.'),
                  Text('Plan to Introduce Them to Other Pets.'),
                  Text('Find a Good Trainer.')
                ],
              ),
            ),
            SizedBox(
                height: 55,
                width: 500,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) =>
                              ConfirmAdoptionDialog(name: pet.name)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      child: const Text(
                        'ADOPT',
                        style: TextStyle(color: Colors.white),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
