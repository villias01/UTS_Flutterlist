import 'package:flutter/material.dart';
import 'package:flutter_app/userdata.dart';

class UserItem extends StatelessWidget {
  UserData userData;
  UserItem(this.userData);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 157, 146, 252),
          child: Text(
            userData.nama[0].toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userData.nama,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Umur :" +
                  userData.umur.toString() +
                  "" +
                  "Email :" +
                  userData.email),
            ],
          ),
        )
      ],
    );
  }
}