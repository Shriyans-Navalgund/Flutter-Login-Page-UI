import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Login(),
    ),
  );
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  bool selected = false;
  bool isPressed = false;

  final myController = TextEditingController();

  var textHolder = AnimatedTextKit(
    animatedTexts: [
      ScaleAnimatedText(
        "Cick Submit",
        textStyle: TextStyle(
          fontSize: 17.0,
          color: Colors.lightBlue[900],
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
    pause: const Duration(milliseconds: 350),
    repeatForever: true,
  );

  @override
  void setState(VoidCallback fn) {
    if (checktextfield(myController.text)) {
      textHolder = AnimatedTextKit(
        animatedTexts: [
          ScaleAnimatedText(
            "Submitted",
            textStyle: TextStyle(
              fontSize: 17.0,
              color: Colors.green[400],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        pause: const Duration(milliseconds: 350),
        totalRepeatCount: 5,
      );
    } else if (!checktextfield(myController.text)) {
      textHolder = AnimatedTextKit(
        animatedTexts: [
          ScaleAnimatedText(
            "Invalid Input",
            textStyle: const TextStyle(
              fontSize: 17.0,
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        pause: const Duration(milliseconds: 350),
        repeatForever: true,
      );
    }
    super.setState(fn);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  bool checktextfield(value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35.0,
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: const Text(
          "LOGIN PAGE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 21.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Enter Login Information",
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const CircleAvatar(
              radius: 55.0,
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
            ),
            const Center(
              child: Text(
                "Enter Username:",
                style: TextStyle(
                  fontFamily: "EBGaramond",
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                controller: myController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Enter Username",
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(
                  () {
                    if (checktextfield(myController.text)) {}
                  },
                );
              },
              icon: const Icon(Icons.subdirectory_arrow_right),
              label: const Text(
                "SUBMIT",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: selected
                  ? const CircularProgressIndicator(
                      color: Colors.amber,
                    )
                  : isPressed
                      ? const Text(
                          "Submitted",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto",
                            fontSize: 17.0,
                          ),
                        )
                      : textHolder,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
