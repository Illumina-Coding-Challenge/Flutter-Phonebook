import 'package:flutter/material.dart';

class ContactShowScreen extends StatelessWidget {
  String name;
  String phone;
  String address;

  ContactShowScreen(
      {Key? key, this.name = '', this.phone = '', this.address = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:  NetworkImage("https://ui-avatars.com/api/?name=$name"),
            ),
            SizedBox(height:10),
            Text(name),
            Text(phone),
            Text(address),
          ],
        ),
      ),
    );
  }
}
