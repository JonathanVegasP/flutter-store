import 'package:flutter/material.dart';
import 'package:flutter_store/resources/colors.dart';
import 'package:flutter_store/resources/images.dart';
import 'package:flutter_store/screens/login.dart';
import 'package:flutter_store/widgets/logo_widget.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Center(
        child: LogoWidget(),
      ),
    );
  }
}
