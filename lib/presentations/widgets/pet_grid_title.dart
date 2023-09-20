import 'package:flutter/material.dart';
import 'package:pets_app/data/models/pet.dart';
import 'package:pets_app/presentations/pages/pet_info_page.dart';

class petGridTitle extends StatelessWidget {
  const petGridTitle({super.key, required this.pet});
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PetInfoPage(pet: pet)));
      },
      child: Container(
        width: 200,
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GridTile(
              footer: Container(
                height: 50,
                color: Colors.deepPurple.withOpacity(0.5),
                child: Text(
                  '${pet.name}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              child: Image.asset('${pet.imageurl}', fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
