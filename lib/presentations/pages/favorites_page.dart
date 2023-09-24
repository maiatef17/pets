import 'package:flutter/material.dart';
import 'package:pets_app/data/data%20source/data_source.dart';
import 'package:pets_app/presentations/widgets/pet_grid_title.dart';


class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, i) =>petGridTitle(
            pet: pets.where((element) => element.isFav == true).toList()[i]),
        itemCount:
            pets.where((element) => element.isFav == true).toList().length,
      ),
    );
  }
}
