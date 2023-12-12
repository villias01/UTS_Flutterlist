import 'package:flutter/material.dart';
import 'package:flutter_app/userdata.dart';
import 'package:flutter_app/useritem.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer';

class UserList extends StatefulWidget {
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  TextEditingController Nama = TextEditingController();

  TextEditingController Umur = TextEditingController();

  TextEditingController Email = TextEditingController();

  List<UserData> daftarUser = [
    UserData("Riel", 24, "rieliesh@gmail.com"),
    UserData("Prana", 21, "pranaz@gmail.com"),
    UserData("Vielin", 22, "phiel@gmail.com"),
  ];

String btnSimpanText = "Simpan";
String btnUbahText = "Ubah";
Color btnSimpanWarna = Color.fromARGB(255, 187, 146, 252);
Color btnUbahnWarna = Color.fromARGB(255, 157, 146, 252);

int IndexDipilih = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: Nama,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: Umur,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Umur",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: Email,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    
                    int jumlahUmur = int.parse(Umur.text);

                    // Menambah record sebanyak jumlah umur yang dimasukkan
                    for (int i = 0; i < jumlahUmur; i++) {
                      daftarUser.add(UserData("${daftarUser.length + 1}. ${Nama.text}", int.parse(Umur.text), Email.text));
                    }
                        try{
                      if(Nama.text.isEmpty || Umur.text.isEmpty || Email.text.isEmpty )
                      throw new Exception("Isian Tidak Boleh Kosong");

                    if(btnSimpanText == "Simpan"){
                      daftarUser.add(UserData(Nama.text, int.parse(Umur.text), Email.text));
                    }else{
                      UserData userData = daftarUser[IndexDipilih];
                      userData.nama = Nama.text;
                      userData.umur = int.parse(Umur.text);
                      userData.email = Email.text;

                      btnSimpanText = "Simpan";
                      btnSimpanWarna = Color.fromARGB(255, 145, 137, 255);
                    }
                    
                    setState(() {
                      UserData;

                    });

                    Nama.text = "";
                    Umur.text = "";
                    Email.text = "";
                    inspect(daftarUser);

                    }catch(e){
                     Fluttertoast.showToast(
                      msg: '$e',
                        );
                        
                        }
                    },
                  child: Text(btnSimpanText),
                  style: ElevatedButton.styleFrom(
                                        minimumSize: Size(150, 75),
                                        backgroundColor : btnSimpanWarna 
                                        ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return 
                        Dismissible(
                          key: ValueKey(daftarUser[index]),
                          child: InkWell(
                            child: UserItem(daftarUser[index]),
                            onTap: () {
                              Nama.text = daftarUser[index].nama;
                        Umur.text = daftarUser[index].umur.toString();
                        Email.text = daftarUser[index].email; 

                        btnSimpanText = btnUbahText;
                        btnSimpanWarna = btnUbahnWarna;
                        setState(() {
                          btnSimpanText;
                          btnSimpanWarna;
                          },
                          );
                  
                            },
                            ),
                      background: Container(
                      padding: EdgeInsets.only(left: 10),
                      color: Colors.red,
                      child: Align(alignment: Alignment.centerLeft,
                      child: Icon(Icons.delete,color: Colors.white)
                      ),
                    ),
                    secondaryBackground: Container(
                      padding: EdgeInsets.only(left: 10),
                      color: Color.fromARGB(255, 187, 187, 187),
                      child: Align(alignment: Alignment.centerLeft,
                      child: Icon(Icons.delete,color: Colors.white)
                      ),
                     ),
                      onDismissed: (direction){
                      daftarUser.removeAt(index);

                      setState(() {
                        daftarUser;
                      });
                    },
                    
                    confirmDismiss: (direction) async {
                      if(direction == DismissDirection.startToEnd){
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Konfirmasi"),
                            content: const Text("Apakah Anda Yakin Akan Menghapus?"),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                  child: const Text("Hapus")
                                ),
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                  child: const Text("Batal")
                                ),
                            ],
                          );
                        },
                      );
                    }else{
                      return false;
                    }
                    },
                            );
                        },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: daftarUser.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
