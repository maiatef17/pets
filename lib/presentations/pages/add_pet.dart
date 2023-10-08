import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pets_app/data/data%20source/pet_local_data_source/pet_local_data_source.dart';
import 'package:pets_app/data/models/pet.dart';
import 'package:pets_app/presentations/pages/pets_page.dart';

class AddPet extends StatefulWidget {
  const AddPet({super.key});

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController imageurl = TextEditingController();
  int id = Random().nextInt(1000);
  PetLocalDSImpl petDS = PetLocalDSImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Add pet',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Form(
          key: key,
          child: ListView(
            children: [
              TextFormField(
                controller: name,
                validator: (String? text) {
                  if (text == null || text.isEmpty) {
                    return 'field is required';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'name',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: imageurl,
                validator: (String? text) {
                  if (text == null || text.isEmpty) {
                    return 'field is required';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'image',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 80,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                onPressed: () {
                  if (key.currentState!.validate()) {
                    id++;
                    petDS.addPet(Pet(id, name.text, imageurl.text));
                    print(id);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetsPage(),
                        ));
                  }
                },
                child: Text(
                  'Save Pet',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
