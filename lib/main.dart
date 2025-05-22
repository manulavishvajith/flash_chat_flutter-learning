import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: 'AIzaSyDsZnNJHjMvozq4LRt8jAZfCNBdztngLCA',
    appId: '1:297117109657:android:82a9c4d6a3fa997adb5708',
    messagingSenderId: '297117109657',
    projectId: 'flash-chat-8842f',
    storageBucket: 'flash-chat-8842f.appspot.com',
  )
  );

  runApp(FlashChat());

}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData.dark().copyWith(
        //   textTheme: const TextTheme(
        //     bodyLarge: TextStyle(color: Colors.black54),
        //   ),
        // ),
        // home: WelcomeScreen(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        });
  }
}
