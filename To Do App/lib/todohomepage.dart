import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todoproviderdb_1/addnotepage.dart';
import 'package:todoproviderdb_1/notesdatabase.dart';
import 'package:todoproviderdb_1/provider.dart';

class TodoHome extends StatefulWidget {
  String Customer;
  TodoHome({super.key, required this.Customer});
  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  bool isUpdate = false;

  //List
  @override
  void initState() {
    super.initState();
    context.read<ProviderDB>().getPreviousNotes();
  }

  int counter = 1;
  Color cardColor() {
    if (counter == 1) {
      counter = 2;
      return const Color.fromRGBO(250, 232, 232, 1);
    } else if (counter == 2) {
      counter = 3;
      return const Color.fromRGBO(232, 237, 250, 1);
    } else {
      counter = 1;
      return const Color.fromRGBO(250, 249, 232, 1);
    }
  }

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Consumer<ProviderDB>(builder: (context, pro, child) {
            List<Map<String, dynamic>> allNotes = pro.getAllNotes();
            return allNotes.isNotEmpty
                ? ListView.builder(
                    itemCount: allNotes.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 70,
                            width: 400,
                            decoration: BoxDecoration(
                              color: cardColor(),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 3),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 300,
                                      child: Text(
                                        allNotes[index]
                                            [Notesdatabase.colNameTitle],
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 300,
                                        child: Text(allNotes[index]
                                            [Notesdatabase.colNameDesc]),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      isUpdate = true;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AddNotePage(
                                                    isUpdate: true,
                                                    titl: allNotes[index][
                                                        Notesdatabase
                                                            .colNameTitle],
                                                    desc: allNotes[index][
                                                        Notesdatabase
                                                            .colNameDesc],
                                                  )));
                                    },
                                    child: Icon(Icons.edit)),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      bool delCheck = await context
                                          .read<ProviderDB>()
                                          .providerDelete(
                                              title: allNotes[index]
                                                  [Notesdatabase.colNameTitle]);
                                      if (delCheck) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Note deleted sucessfully")));
                                      }
                                    },
                                    child: Icon(Icons.delete)),
                              ],
                            ),
                          ),
                        ],
                      );
                    })
                : Center(
                    child: Text("No Notes!!"),
                  );
          })),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotePage()));
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 200,
                ),
                Image.asset(
                  "assets/person.png",
                  height: 100,
                  width: 100,
                ),
                Text(
                  "Hii ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),
                ),
                Text(widget.Customer,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
