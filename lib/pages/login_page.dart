import 'package:flutter/material.dart';

import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController =
      TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isValid = phoneController.text.length == 10;

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 232, 234, 235),

      body: Center(
        child: Container(
          width: 400,
          height: 500,
          color: Colors.white,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 30),

              const Center(
                child: Text(
                  'JioMart',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              const Center(
                child: Text(
                  'Enter your mobile number 9876543210',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  'A 6-digit OTP will be sent on SMS',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20),

                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),

                child: Row(
                  children: [

                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Text(
                        '+91',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextField(
                        controller: phoneController,

                        keyboardType:
                            TextInputType.phone,

                        maxLength: 10,

                        onChanged: (value) {
                          setState(() {});
                        },

                        decoration:
                            const InputDecoration(
                          hintText: 'Mobile number',
                          border: InputBorder.none,
                          counterText: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              GestureDetector(
                onTap: isValid
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OTPPage(
                              phoneNumber:
                                  phoneController.text.trim(),
                            ),
                          ),
                        );
                      }
                    : null,

                child: Container(
                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),

                  width: double.infinity,
                  height: 50,

                  color: isValid
                      ? Colors.black
                      : Colors.grey.shade300,

                  child: Center(
                    child: Text(
                      'Next',

                      style: TextStyle(
                        color: isValid
                            ? Colors.white
                            : Colors.grey,

                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}