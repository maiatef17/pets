import 'package:flutter/material.dart';
import 'package:pets_app/data/data%20source/user_local_data_source/user_local_data_source.dart';
import 'package:pets_app/data/models/user.dart';
import 'package:pets_app/presentations/pages/pets_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Sign Up Page',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: FutureBuilder<bool>(
          future: UserLocalDSImpl().hasSignedUp().then((value) {
            if (value) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => PetsPage()));
            }
            return value;
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            return Form(
                key: key,
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    TextFormField(
                      controller: Name,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return 'field is req';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        controller: Email,
                        validator: (text) {
                          if (text == null ||
                              !text.contains('@') ||
                              text.startsWith('@') ||
                              !text.endsWith('.com') ||
                              text.length < 5) {
                            return 'invalid Email';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                        )),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        controller: Password,
                        validator: (pass) {
                          if (pass == null || pass.length < 6) {
                            return 'field is req';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                        )),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          await UserLocalDSImpl().setUser(User(
                            name: Name.text,
                            email: Email.text,
                            password: Password.text,
                          ));
                          UserLocalDSImpl().hasSignedUp();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PetsPage()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ));
          }),
    );
  }
}
