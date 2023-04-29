import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samet_aydin/service/auth_service.dart';
import 'package:flutter_samet_aydin/utils/customColors.dart';
import 'package:flutter_samet_aydin/utils/customTextStyle.dart';
import 'package:flutter_samet_aydin/widgets/custom_text_button.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String topImage = "assets/images/smtaydin.png";
    return Scaffold(
      body: appBody(height, topImage),
    );
  }

  SingleChildScrollView appBody(double height, String topImage) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topImageContainer(height, topImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    titleText(),
                    customSizedBox(),
                    customSizedBox(),
                    customSizedBox(),
                    customSizedBox(),
                    signInButton(),
                    signInButton2(),
                    customSizedBox(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text titleText() {
    return Text(
      "Merhaba, \nHosgeldin",
      style: CustomTextStyle.titleTextStyle,
    );
  }

  Center signInButton() {
    return Center(
      child: TextButton(
        onPressed: () async {
          Navigator.pushReplacementNamed(context, "/loginPage");
        },
        child: Container(
          height: 50,
          width: 200,
          margin: EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromARGB(255, 80, 202, 218)),
          child: Center(
            child: customText("Kullanıcı Girişi", Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
    );
  }

  Center signInButton2() {
    return Center(
      child: TextButton(
        onPressed: () async {
          Navigator.pushReplacementNamed(context, "/secondPage");
        },
        child: Container(
          height: 50,
          width: 200,
          margin: EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromARGB(255, 80, 202, 218)),
          child: Center(
            child: customText("Restoran Girişi", Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
    );
  }

  Container topImageContainer(double height, String topImage) {
    return Container(
      height: height * .25,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(topImage),
        ),
      ),
    );
  }

  Widget customSizedBox() => SizedBox(
        height: 20,
      );

  Widget customText(String text, Color color) => Text(
        text,
        style: TextStyle(color: color),
      );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 0, 91, 133),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 0, 113, 121),
        ),
      ),
    );
  }
}
