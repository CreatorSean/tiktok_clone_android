import 'package:flutter/material.dart';
import 'package:tiktok_clone_android/constants/gaps.dart';

import '../../constants/sizes.dart';
import 'password_screen.dart';
import 'widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailStrController = TextEditingController();

  String _emailStr = "";

  String? _isEmailValid() {
    if (_emailStr.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_emailStr)) {
      return "Email not valid";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _emailStrController.addListener(
      () {
        setState(() {
          _emailStr = _emailStrController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _emailStrController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_emailStr.isEmpty || _isEmailValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Sign up',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "What is your email",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v8,
              TextField(
                controller: _emailStrController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  hintText: 'Email',
                  errorText: _isEmailValid(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  isDisabled: _emailStr.isEmpty || _isEmailValid() != null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
