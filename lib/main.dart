import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoraunt/cubit/Statesregister.dart';
import 'package:restoraunt/cubit/cubitregister.dart';
import 'package:restoraunt/home.dart';
import 'package:restoraunt/login.dart';
import 'package:restoraunt/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDhgimKv-f4Iu5qVCF7c5vYhMx52xE-_gw",
    projectId: "restoapp-74b7f",
    messagingSenderId: "21770946054",
    appId: "1:21770946054:web:2fbfcde29c01f8bd82a587",
  ));
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit()..getRooms(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) => const MaterialApp(
          home: SignUp(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
