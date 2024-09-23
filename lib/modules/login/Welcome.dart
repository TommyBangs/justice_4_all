import 'package:flutter/material.dart';
import 'package:justice_4_all/modules/login/login.dart';
import 'package:justice_4_all/modules/login/signup.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.6,
                    child: Image.asset(
                      'assets/images/2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontFamily: 'Noto Serif',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002341),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF002341),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'To Continue',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 16,
                                color: Colors.grey[300],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _BuildButton(
                                    text: 'Log in',
                                    color: Color(0xFFC0C0C0),
                                    textColor: Colors.black,
                                    route: LoginPage(),
                                  ),
                                  _BuildButton(
                                    text: 'Sign up',
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    route: SignUpPage(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class _BuildButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Widget route;

  const _BuildButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Open Sans',
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
