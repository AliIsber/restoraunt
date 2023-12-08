import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:restoraunt/Rooms.dart';
import 'package:restoraunt/cubit/Statesregister.dart';
import 'package:restoraunt/cubit/cubitregister.dart';
import 'package:restoraunt/home.dart';

class AddNewRoom extends StatefulWidget {
  const AddNewRoom({super.key});

  @override
  State<AddNewRoom> createState() => _AddNewRoomState();
}

class _AddNewRoomState extends State<AddNewRoom> {
  var imagecontroller = TextEditingController();
  var descryptioncontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var priceController = TextEditingController();
  final restForm= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is AddRoomSuccessState) {
            Fluttertoast.showToast(
                msg: 'room added successfully ',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => HomeScreen())));
          }
        },
        builder: (context, state) => Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
               Form(
                key: restForm,
                child:  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: imagecontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'room image must not be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('room image'),
                  prefixIcon: Icon(Icons.photo_camera),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descryptioncontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ' descryption must not be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('descrytion'),
                  prefixIcon: Icon(Icons.description),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: datecontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ' date must not be empty';
                  }
                  return null;
                },
                onTap: () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(2101))
                      .then((value) {
                    //intl package
                    datecontroller.text = DateFormat.yMMMd().format(value!);
                  });
                },
                decoration: const InputDecoration(
                  label: Text('become ready in'),
                  prefixIcon: Icon(Icons.date_range),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: priceController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ' price must not be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('price'),
                  prefixIcon: Icon(Icons.description),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                  color: Colors.blue[400],
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: TextButton(
                      onPressed: () {
                        print('asdasd');
                        RegisterCubit.get(context).addNewRoom(
                            image: imagecontroller.text,
                            price: priceController.text,
                            descryption: descryptioncontroller.text,
                            date: datecontroller.text);
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      )))
            ])),
          ),
        ),
      ),
    );
  }
}
