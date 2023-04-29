import 'package:flutter_samet_aydin/pages/auth/entry/first_page.dart';

import '../home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../themes/app_theme.dart';

class ExitScreen extends StatefulWidget {
  const ExitScreen({Key? key}) : super(key: key);

  @override
  State<ExitScreen> createState() => _ExitScreenState();
}

class _ExitScreenState extends State<ExitScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FirstPage()));
          },
        ),
      ],
    );
  }
}
