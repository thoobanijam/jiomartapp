import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'jiomart_dashboard.dart';

class OTPPage extends StatefulWidget {
  final String phoneNumber;

  const OTPPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController otpController =
      TextEditingController();

  String verificationId = '';

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    sendOTP();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  // =========================
  // SEND OTP
  // =========================
  Future<void> sendOTP() async {
    setState(() {
      isLoading = true;
    });

    // Remove spaces and any other non-numbers
    String cleanPhoneNumber =
        widget.phoneNumber.replaceAll(RegExp(r'\D'), '');

    String phoneNumber = '+91$cleanPhoneNumber';

    debugPrint('==============================');
    debugPrint('SENDING OTP');
    debugPrint('Phone: $phoneNumber');
    debugPrint('==============================');

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,

        // =========================
        // AUTOMATIC VERIFICATION
        // =========================
        verificationCompleted:
            (PhoneAuthCredential credential) async {
          try {
            await FirebaseAuth.instance
                .signInWithCredential(credential);

            if (!mounted) return;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const JioMartDashboard(),
              ),
            );
          } catch (e) {
            debugPrint(
              'Automatic verification error: $e',
            );
          }
        },

        // =========================
        // VERIFICATION FAILED
        // =========================
        verificationFailed:
            (FirebaseAuthException error) {
          debugPrint(
            'Firebase error code: ${error.code}',
          );

          debugPrint(
            'Firebase error message: ${error.message}',
          );

          if (!mounted) return;

          setState(() {
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                error.message ??
                    'OTP verification failed',
              ),
            ),
          );
        },

        // =========================
        // OTP SENT
        // =========================
        codeSent:
            (String id, int? resendToken) {
          verificationId = id;

          if (!mounted) return;

          setState(() {
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'OTP sent successfully',
              ),
            ),
          );
        },

        // =========================
        // TIMEOUT
        // =========================
        codeAutoRetrievalTimeout:
            (String id) {
          verificationId = id;
        },
      );
    } catch (e) {
      debugPrint('OTP error: $e');

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error: $e',
          ),
        ),
      );
    }
  }

  // =========================
  // VERIFY OTP
  // =========================
  Future<void> verifyOTP() async {
    if (otpController.text.length != 6) {
      return;
    }

    if (verificationId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please wait for OTP',
          ),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text.trim(),
      );

      // Login user into Firebase
      await FirebaseAuth.instance
          .signInWithCredential(credential);

      debugPrint('==============================');
      debugPrint('LOGIN SUCCESSFUL');
      debugPrint(
        'UID: ${FirebaseAuth.instance.currentUser?.uid}',
      );
      debugPrint(
        'Phone: ${FirebaseAuth.instance.currentUser?.phoneNumber}',
      );
      debugPrint('==============================');

      if (!mounted) return;

      // Go to dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const JioMartDashboard(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      debugPrint(
        'OTP verification error: ${error.code}',
      );

      debugPrint(
        'Message: ${error.message}',
      );

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.message ??
                'Invalid OTP',
          ),
        ),
      );
    }
  }

  // =========================
  // BUILD UI
  // =========================
  @override
  Widget build(BuildContext context) {
    bool isValid =
        otpController.text.length == 6;

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 232, 234, 235),

      body: SafeArea(
        child: Stack(
          children: [

            // =========================
            // BACK ARROW
            // =========================
            Positioned(
              top: 15,
              left: 15,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 28,
                ),
              ),
            ),

            // =========================
            // OTP CARD
            // =========================
            Center(
              child: Container(
                width: 400,
                height: 500,
                color: Colors.white,

                child: Column(
                  children: [

                    const SizedBox(height: 30),

                    // JIOMART LOGO / TITLE
                    const Text(
                      'JioMart',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(height: 35),

                    // TITLE
                    const Text(
                      'Verify and log in',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // PHONE NUMBER
                    Text(
                      'Enter the OTP sent to\n'
                      '+91 ${widget.phoneNumber}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // =========================
                    // OTP TEXT FIELD
                    // =========================
                    Container(
                      margin:
                          const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),

                      decoration:
                          BoxDecoration(
                        border: Border.all(
                          color:
                              Colors.grey.shade300,
                        ),
                      ),

                      child: TextField(
                        controller:
                            otpController,

                        keyboardType:
                            TextInputType.number,

                        maxLength: 6,

                        onChanged: (value) {
                          setState(() {});
                        },

                        decoration:
                            const InputDecoration(
                          hintText:
                              'Enter 6 digit OTP',

                          border:
                              InputBorder.none,

                          contentPadding:
                              EdgeInsets.symmetric(
                            horizontal: 15,
                          ),

                          counterText: '',
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // =========================
                    // LOGIN BUTTON
                    // =========================
                    GestureDetector(
                      onTap:
                          isValid && !isLoading
                              ? verifyOTP
                              : null,

                      child: Container(
                        margin:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 20,
                        ),

                        width:
                            double.infinity,

                        height: 50,

                        color:
                            isValid &&
                                    !isLoading
                                ? Colors.black
                                : Colors
                                    .grey
                                    .shade300,

                        child: Center(
                          child: isLoading
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,

                                  child:
                                      CircularProgressIndicator(
                                    color:
                                        Colors.white,
                                    strokeWidth:
                                        2,
                                  ),
                                )
                              : Text(
                                  'Log in',

                                  style:
                                      TextStyle(
                                    color:
                                        isValid
                                            ? Colors
                                                .white
                                            : Colors
                                                .grey,

                                    fontSize:
                                        16,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // =========================
                    // RESEND OTP
                    // =========================
                    TextButton(
                      onPressed:
                          isLoading
                              ? null
                              : sendOTP,

                      child: const Text(
                        'Resend OTP',

                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}