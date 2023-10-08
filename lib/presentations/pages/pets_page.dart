import 'package:flutter/material.dart';
import 'package:pets_app/data/data%20source/pet_local_data_source/pet_local_data_source.dart';
import 'package:pets_app/data/data%20source/user_local_data_source/user_local_data_source.dart';
import 'package:pets_app/data/models/user.dart';
import 'package:pets_app/presentations/pages/add_pet.dart';
import 'package:pets_app/presentations/pages/adopt_page.dart';
import 'package:pets_app/presentations/pages/favorites_page.dart';
import 'package:pets_app/presentations/pages/form_page.dart';

import '../widgets/pet_grid_title.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    Padding(
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
          future: PetLocalDSImpl().getPet(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
              itemBuilder: (context, i) => petGridTitle(
                pet: snapshot.data![i],
              ),
              itemCount: snapshot.data!.length,
            );
          }),
    ),
    FavoritesPage(),
    AdoptedPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            children: [
              Image.asset(
                'assets/images/21.webp',
              ),
              ElevatedButton(
                onPressed: () {
                  UserLocalDSImpl().logOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: BeveledRectangleBorder()),
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () async {
              await Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AddPet()));
              setState(() {});
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.deepPurple,
        title: FutureBuilder<User>(
          future: UserLocalDSImpl().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final user = snapshot.data;
              return Text(
                currentIndex == 0
                    ? 'Welcome, ${user!.name}'
                    : currentIndex == 1
                        ? 'Favorite'
                        : 'Adopted',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              );
            }
          },
        ),
      ),
      body: _pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) async {
          setState(() {
            currentIndex = index;
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
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Adopted',
          ),
        ],
      ),
    );
  }
}
