import 'package:flutter/material.dart';
import 'package:kinkun_app/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    Future.delayed(
      Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                'assets/images/fastfood.png',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'กินกัน',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            CircularProgressIndicator(
              color: Colors.brown[500],
              strokeWidth: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
