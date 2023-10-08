import 'package:flutter/material.dart';
import 'package:pets_app/data/models/pet.dart';
import 'package:pets_app/presentations/pages/pet_info_page.dart';

class petGridTitle extends StatefulWidget {
  const petGridTitle({super.key, required this.pet});
  final Pet pet;

  @override
  State<petGridTitle> createState() => _petGridTitleState();
}

class _petGridTitleState extends State<petGridTitle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
       await Navigator.push(context,
            MaterialPageRoute(builder: (context) => PetInfoPage(pet: widget.pet)));
            setState(() {
              
            });
            
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
                  widget.pet.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              child: Image.asset(widget.pet.imageurl, fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
