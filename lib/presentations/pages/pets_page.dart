import 'package:flutter/material.dart';
import 'package:pets_app/data/data%20source/data_source.dart';

import '../widgets/pet_grid_title.dart';

class petsPage extends StatefulWidget {
  const petsPage({super.key});

  @override
  State<petsPage> createState() => _petsPageState();
}

class _petsPageState extends State<petsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'welcome, USERNAME',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, i) => petGridTitle(
            pet: pets[i],
          ),
          itemCount: pets.length,
        ));
  }
}
