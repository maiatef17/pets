import 'package:flutter/material.dart';
import 'package:pets_app/data/data%20source/pet_local_data_source/pet_local_data_source.dart';
import 'package:pets_app/data/models/pet.dart';
import 'package:pets_app/presentations/widgets/dialog.dart';

class PetInfoPage extends StatefulWidget {
  const PetInfoPage({Key? key, required this.pet});
  final Pet pet;
  @override
  State<PetInfoPage> createState() => _PetInfoPageState();
}

class _PetInfoPageState extends State<PetInfoPage> {
  PetLocalDSImpl ds = PetLocalDSImpl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'ID # ${widget.pet.id} ${widget.pet.name}',
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
                child: Image.asset(widget.pet.imageurl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ${widget.pet.id}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurple),
                  ),
                  Text(
                    'Name: ${widget.pet.name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 8),
                  const Text('TIPS:'),
                  const Text(
                      'Spend Time With Them Before You Bring Them Home.'),
                  const Text('Set Up a Space Just For Them.'),
                  const Text('Pet Proof Your Home.'),
                  const Text('Plan to Introduce Them to Other Pets.'),
                  const Text('Find a Good Trainer.')
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
                          builder: (context) => ConfirmAdoptionDialog(
                                name: widget.pet.name,
                                pet: widget.pet,
                              )),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            PetLocalDSImpl().togglePetFavorite(widget.pet.id.toString());
            widget.pet.isFav = !widget.pet.isFav;
          });

          ScaffoldMessenger.of(context).clearSnackBars();
          if (!widget.pet.isFav) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Removed from a favorite!"),
                duration: Duration(seconds: 1),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Marked as a favorite!"),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        child: widget.pet.isFav
            ? Icon(
                Icons.favorite,
                color: Colors.white,
              )
            : Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
