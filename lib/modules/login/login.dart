import 'package:flutter/material.dart';
import 'package:justice_4_all/modules/login/forgot_password.dart';
import 'package:justice_4_all/modules/login/signup.dart';
import 'package:justice_4_all/modules/login/Welcome.dart';
import 'package:justice_4_all/modules/home/home_page.dart'; // Add this import

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back button
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomePage()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: const Icon(Icons.arrow_back,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        Text(
                          'Log in',
                          style: TextStyle(
                            fontFamily: 'Noto Serif',
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        _buildInputField(
                            context, 'Email address', 'example@gmail.com'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        _buildInputField(context, 'Password', '••••••••••••',
                            isPassword: true),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage()),
                              );
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.035),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        _buildButton(
                            context, 'Log in', const Color(0xFF002341)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        Center(
                          child: Text(
                            'Or Login with',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: Colors.grey,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        _buildButton(context, 'Continue with Google',
                            const Color(0xFFC0C0C0),
                            textColor: Colors.black),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                ),
                                children: [
                                  const TextSpan(
                                      text: "Don't have an account? "),
                                  TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      color: Colors.blue[700],
                                      fontWeight: FontWeight.bold,
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInputField(BuildContext context, String label, String hint,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: MediaQuery.of(context).size.width * 0.035),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String text, Color color,
      {Color textColor = Colors.white}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (text == 'Log in') {
            // Navigate to HomePage
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Open Sans',
            color: textColor,
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
