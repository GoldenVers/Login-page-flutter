import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/components/OnboardContent.dart';

//this is the main function of the buttom sheet, the main dart comes to here

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(42),
        ),
      ),
      builder: (_) => const OnboardContent(),
    );
  }

  @override
  void initState() {
    super.initState();
    // No need to call showModalBottomSheet here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // You can also access inherited widgets or their values here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: showBottomSheet,
          child: Text("Press Me"), // Change the button text to "Press Me"
        ),
      ),
    );
  }
}
