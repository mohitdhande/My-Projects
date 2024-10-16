import 'package:flutter/material.dart';
import 'package:mohit_bloc_1/drawer.dart';

class Profile extends StatelessWidget {
  String name;
  Profile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    TextEditingController pName = TextEditingController(text: name);
    TextEditingController pAddress = TextEditingController();
    TextEditingController pmobNo = TextEditingController();
    TextEditingController pEmail = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // Height of the AppBar
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0), // Curving bottom left corner
                bottomRight:
                    Radius.circular(40.0), // Curving bottom right corner
              ),
              child: AppBar(
                title: Text(
                  "Account Details",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 235, 186, 206),
              ))),
              drawer: DrawerToAll(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/person.png",
                  height: 150,
                  width: 150,
                ),
              ),
              Text(
                'Your Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: pName,
                decoration: InputDecoration(
                  hintText: 'Enter text',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Circular borders
                    borderSide: BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Circular borders when enabled
                    borderSide: BorderSide(
                        color: Colors.blue), // Customize border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Circular borders when focused
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0), // Customize focused border
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter Mobile No.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: pmobNo,
                decoration: InputDecoration(
                  hintText: 'Mobile No.',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Circular borders
                    borderSide: BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Circular borders when enabled
                    borderSide: BorderSide(
                        color: Colors.blue), // Customize border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Circular borders when focused
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0), // Customize focused border
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter email',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: pEmail,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Circular borders
                    borderSide: BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Circular borders when enabled
                    borderSide: BorderSide(
                        color: Colors.blue), // Customize border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Circular borders when focused
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0), // Customize focused border
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter Address',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: pAddress,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Circular borders
                    borderSide: BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Circular borders when enabled
                    borderSide: BorderSide(
                        color: Colors.blue), // Customize border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Circular borders when focused
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0), // Customize focused border
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                            "Saved Successfully",
                            style: TextStyle(color: Colors.green),
                          )),
                        );
                      },
                      child: Container(
                        height: 70,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Color.fromARGB(255, 235, 186, 206),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.15),
                                  offset: Offset(5, 5),
                                  spreadRadius: 0,
                                  blurRadius: 8)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Save',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 70,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Color.fromARGB(255, 235, 186, 206),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.15),
                                  offset: Offset(5, 5),
                                  spreadRadius: 0,
                                  blurRadius: 8)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Cancel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
