import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      upperBound: 1,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    speed: const Duration(milliseconds: 500),
                    textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ])
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Colors.lightBlueAccent,
              title: 'Log in',
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              color: Colors.blueAccent,
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}


