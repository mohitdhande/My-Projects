import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todoproviderdb_1/main.dart';
import 'package:todoproviderdb_1/provider.dart';

class AddNotePage extends StatelessWidget {
  bool isUpdate;
  String titl;
  String desc;

  AddNotePage({this.isUpdate = false, this.titl = "", this.desc = ""});
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  //List
  @override
  Widget build(BuildContext context) {
    if (isUpdate) {
      title.text = titl;
      description.text = desc;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Update Todo' : 'Add Todo',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.all(20),
            //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextFormField(
              controller: title,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.title),
                  labelText: 'title',
                  hintText: 'Enter Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextFormField(
              controller: description,
              maxLines: 4,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.description),
                  labelText: 'description',
                  hintText: 'Enter Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  var titlee = title.text;
                  var desce = description.text;
                  if (titlee.isNotEmpty && desce.isNotEmpty) {
                    if (isUpdate) {
                      Future<bool> upCheck = context
                          .read<ProviderDB>()
                          .providerUpdate(
                              title: title.text, desc: description.text);
                      if (await upCheck) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Note Updated sucessfully")));
                      }
                    } else {
                      Future<bool> addCheck = context
                          .read<ProviderDB>()
                          .providerAdd(
                              title: title.text, desc: description.text);
                      if (await addCheck) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Note Added sucessfully")));
                      }
                    }
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Please fill all the required blanks!!')));
                  }
                },
                child: Text(
                  isUpdate ? 'Update Note' : 'Add Note',
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
