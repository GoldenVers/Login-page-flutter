import 'package:flutter/material.dart';
import 'package:login/onboarding_screen.dart';

//this is a project about making a dynamic login page, the main function goes to onboarding screen
//the onboardcontent is what main dynamics is going on, the main animations and all the shit in the functions are there
//the signupform is the signup page, yea thats it 
//the landing content is the texts in the onboarding content

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
