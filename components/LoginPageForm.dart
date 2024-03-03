import 'package:flutter/material.dart';

class LoginPageForm extends StatelessWidget {
  const LoginPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome back",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const _TextField(
              label: 'Email address',
              icon: Icons.email,
            ),
            const SizedBox(height: 10),
            const _TextField(
              label: 'Password',
              icon: Icons.lock,
              hidden: true,
            ),
            const SizedBox(height: 175),
            Row(
              children: [
                Text(
                  "New here? ",
                  style:
                      TextStyle(fontSize: 16, color: Colors.blueGrey.shade300),
                ),
                Text(
                  "Sign up now ",
                  style: TextStyle(fontSize: 16, color: Colors.blue.shade300),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool hidden;

  const _TextField({
    Key? key,
    required this.label,
    required this.icon,
    this.hidden = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              cursorColor: Colors.pink.shade400,
              obscureText: hidden,
              autocorrect: !hidden,
              enableSuggestions: !hidden,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 18,
                ),
                suffixIcon: Icon(
                  icon,
                  color: Colors.grey.shade400,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink.shade400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
