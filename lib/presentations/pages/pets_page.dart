import 'package:flutter/material.dart';
import 'package:pets_app/data/data%20source/data_source.dart';
import 'package:pets_app/presentations/pages/add_pet.dart';
import 'package:pets_app/presentations/pages/favorites_page.dart';

import '../widgets/pet_grid_title.dart';

class petsPage extends StatefulWidget {
  const petsPage({super.key});

  @override
  State<petsPage> createState() => _petsPageState();
}

class _petsPageState extends State<petsPage> {
   int currentIndex = 0;

  final List<Widget> _pages = [
    GridView.builder(
         gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, i) => petGridTitle(
            pet: pets[i],
          ),
          itemCount: pets.length,
         ),
    
    FavoritesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AddPet())),
                child: Icon(Icons.add,color: Colors.white,),
          ),
          
        ],
          backgroundColor: Colors.deepPurple,
          title: Text(
            currentIndex == 0 ? 'welcome' : 'Favorite',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: _pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
