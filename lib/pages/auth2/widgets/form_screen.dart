import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Open Mailer"),
          backgroundColor: Color.fromARGB(255, 82, 186, 255),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      String email =
                          Uri.encodeComponent("bsametbaran@hotmail.com");
                      String subject = Uri.encodeComponent(
                          "Merhaba Restoran Başvurusu İçin:");
                      String body = Uri.encodeComponent(
                          "Merhaba, Restoranımı kayıt ettirmek istiyorum; Restoranımın konumu bu şekildedir.");
                      print(subject);
                      Uri mail = Uri.parse(
                          "mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                        //email app opened
                      } else {
                        //email app is not opened
                      }
                    },
                    child: Text("Mail Us Now"))
              ],
            )));
  }
}
