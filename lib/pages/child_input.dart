import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'child_activities.dart'; // Import the ChildActivitiesPage

class ChildInputPage extends StatefulWidget {
  const ChildInputPage({super.key});

  @override
  _ChildInputPageState createState() => _ChildInputPageState();
}

class _ChildInputPageState extends State<ChildInputPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String age = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the background behind the app bar
      appBar: AppBar(
        title: const Text('Input Data Anak'),
        backgroundColor:
            Colors.blueAccent, // Set app bar background to blueAccent
        foregroundColor: Colors.white,
        elevation: 0, // Remove app bar shadow
      ),
      backgroundColor:
          Colors.blueAccent, // Set scaffold background to blueAccent
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/anak2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      FontAwesomeIcons.babyCarriage,
                      size: 60,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Data Anak',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Nama Anak',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.blueAccent),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter the Nama Anak' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Umur Anak',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.cake, color: Colors.blueAccent),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter the Umur Anak' : null,
                      onChanged: (val) {
                        setState(() => age = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Submit'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChildActivitiesPage(
                                childName: name,
                                childAge: int.parse(age),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
