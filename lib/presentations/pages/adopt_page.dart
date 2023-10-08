import 'package:flutter/material.dart';
import 'package:pets_app/data/data%20source/pet_local_data_source/pet_local_data_source.dart';
import 'package:pets_app/data/models/pet.dart';
import 'package:pets_app/presentations/widgets/pet_grid_title.dart';

class AdoptedPage extends StatefulWidget {
  const AdoptedPage({Key? key}) : super(key: key);

  @override
  State<AdoptedPage> createState() => _AdoptedPageState();
}

class _AdoptedPageState extends State<AdoptedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: PetLocalDSImpl().getPet(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              List<Pet> pets = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisSpacing: 16),
                itemBuilder: (context, i) => petGridTitle(
                    pet: pets
                        .where((element) => element.isAdopt == true)
                        .toList()[i]),
                itemCount: pets
                    .where((element) => element.isAdopt == true)
                    .toList()
                    .length,
              );
            }),
      ),
    );
  }
}
