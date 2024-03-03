// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:login/components/LandingContent.dart';
import 'package:login/components/LoginPageForm.dart';
import 'package:login/components/SignUpForm.dart';

//here is what is the real shit going on, the entire movements between pages is here

class OnboardContent extends StatefulWidget {
  const OnboardContent({super.key});

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  late PageController _OnboardPageController;
  @override
  void initState() {
    _OnboardPageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _OnboardPageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // You can also access inherited widgets or their values here if needed
  }

  @override
  Widget build(BuildContext context) {
    final double progress = _OnboardPageController.hasClients
        ? (_OnboardPageController.page ?? 0).clamp(0.0, 1.0)
        : 0;
    print('Progress: $progress');
    return SafeArea(
      child: SizedBox(
        height: 420 + progress * 100,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: PageView(
                    controller: _OnboardPageController,
                    children: const [
                      LandingContent(),
                      SignUpForm(),
                      LoginPageForm(),
                    ],
                  ),
                ),
              ],
            ),
            //the button
            Positioned(
              height: 56,
              bottom: 32 + progress * 100,
              right: 16,
              child: GestureDetector(
                onTap: () {
                  final currentPage = _OnboardPageController.page?.round() ?? 0;
                  if (currentPage < 2) {
                    _OnboardPageController.animateToPage(
                      currentPage + 1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.black,
                  ),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 92 + progress * 32,
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: (1 - progress).clamp(0.0, 1.0),
                                child: Center(
                                  child: Text(
                                    "Join in",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: progress.clamp(0.0, 1.0),
                                child: Center(
                                  child: Text(
                                    "Create account",
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
