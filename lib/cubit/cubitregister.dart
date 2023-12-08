import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoraunt/cubit/Statesregister.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restoraunt/models.dart/roommodel.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool ispassword = true;
  IconData suffix = Icons.visibility;
  void changePasswordvisisbilkity() {
    ispassword = !ispassword;
    suffix = ispassword ? Icons.visibility : Icons.visibility_off;
    emit(PasswordChangState());
  }

  void logIn({
    required email,
    required password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LogInSuccessState());
    }).catchError((error) {
      emit(LogInErrorState(error.toString()));
    });
  }

  void signUp({
    required x,
    required y,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: x, password: y)
        .then((value) {
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void addNewRoom({
    required image,
    required descryption,
    required date,
    required price,
  }) async {
    print('loading');
    RoomModel room = RoomModel(image: image, descryption: descryption, date: date, price: price);
    print('lloging in');
    await FirebaseFirestore.instance
        .collection('room')
        .add(room.tomap())
        .then((value) {
      getRooms();
      emit(AddRoomSuccessState());
      print('loged in');
    }).catchError((error) {
      emit(AddRoomErrorState(error.toString()));
      print('error');
    });
  }

  List<RoomModel> rooms = [];

  void getRooms() {
    rooms = [];
    FirebaseFirestore.instance.collection('room').get().then((value) {
      value.docs.forEach((element) {
        rooms.add(RoomModel.fromJson(element.data()));
        print(rooms);
        emit(GetRoomSuccessState());
      });
    }).catchError((error) {
      emit(GetRoomErrorState(error.toString()));
    });
  }
}
