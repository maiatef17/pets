import 'dart:convert';

import 'package:pets_app/data/models/pet.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PetLocalDS {
  Future<List<Pet>> getPet();
  Future<void> addPet(Pet pet);
  Future<void> togglePetFavorite(String petID);
  Future<void> togglePetAdopt(String petID);
}

const String petsKey = 'petsList';

class PetLocalDSImpl implements PetLocalDS {
  @override
  Future<List<Pet>> getPet() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> petsJson = prefs.getStringList(petsKey) ?? [];
    List<Pet> pets = [];
    for (int i = 0; i < petsJson.length; i++) {
      final petJson = petsJson[i];
      final Map petMap = jsonDecode(petJson);
      Pet pet = Pet.fromMap(petMap);
      pets.add(pet);
    }

    return pets;
  }

  @override
  Future<void> addPet(Pet pet) async {
    final prefs = await SharedPreferences.getInstance();
    Map petMap = pet.toMap();
    final String petJson = jsonEncode(petMap);
    List<String> petsJson = prefs.getStringList(petsKey) ?? [];
    petsJson.add(petJson);
    await prefs.setStringList(petsKey, petsJson);
  }

  @override
  Future<void> togglePetFavorite(String petID) async {
    final pets = await getPet();
    Pet? pet;
    for (int i = 0; i < pets.length; i++) {
      if (pets[i].id.toString() == petID) {
        pet = pets[i];
      }
    }
    if (pet == null) throw Exception('pet not found');
    pet.isFav = !pet.isFav;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(petsKey);
    for (int i = 0; i < pets.length; i++) {
      if (pets[i].id.toString() != petID) {
        await addPet(pets[i]);
      } else {
        await addPet(pet);
      }
    }
  }

  @override
  Future<void> togglePetAdopt(String petID) async {
    final pets = await getPet();
    Pet? pet;
    for (int i = 0; i < pets.length; i++) {
      if (pets[i].id.toString() == petID) {
        pet = pets[i];
      }
    }
    if (pet == null) throw Exception('pet not found');
    pet.isAdopt = !pet.isAdopt;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(petsKey);
    for (int i = 0; i < pets.length; i++) {
      if (pets[i].id.toString() != petID) {
        await addPet(pets[i]);
      } else {
        await addPet(pet);
      }
    }
  }
}
