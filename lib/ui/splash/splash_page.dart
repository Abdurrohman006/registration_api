import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:registration_api/ui/authorization/register_page.dart';
import 'package:registration_api/ui/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    var auth = Hive.box("auth");
    Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                auth.get("token", defaultValue: '').toString().isNotEmpty ? const HomePage() : const RegisterPage(),
          ),
          (route) => false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Welcome",
          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
