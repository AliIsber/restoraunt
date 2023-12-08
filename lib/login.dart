import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restoraunt/cubit/Statesregister.dart';
import 'package:restoraunt/cubit/cubitregister.dart';
import 'package:restoraunt/home.dart';
import 'package:restoraunt/signup.dart';
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailcontroller=TextEditingController();
  final passcontroller=TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.blue[200],
     body: BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (context, state) {
         if(state is LogInSuccessState){
          Fluttertoast.showToast(
              msg: 'wellcome ',
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
       builder:(context,state) =>Center(
         child: Form(
          key: formKey,
           child: Column(children: [
           const SizedBox(height: 50,),
           const Icon(Icons.ac_unit,size: 100, ),
            const  SizedBox(height:5,),
              Text("welcom here",style: TextStyle(color: Colors.grey[700],fontSize: 16),),
             const SizedBox(height: 25,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                controller:emailcontroller ,
                validator: (value) {
                  if(value!.isEmpty){
                     return 'email address must not ne empty';
                  }
                 return null;
                },
            decoration: InputDecoration(
                         label: Text('email'),
              prefixIcon:Icon( Icons.mail),
              enabledBorder:const OutlineInputBorder(
                borderSide:BorderSide(color: Colors.white) ,
             
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.grey.shade400) ,
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
               ),
             
             
             
           ),
             ),
              Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextFormField(
            controller:passcontroller ,
            obscureText: RegisterCubit.get(context).ispassword,
             validator: (value) {
                  if(value!.isEmpty){
                     return 'password  must not ne empty';
                  }
                 return null;
                },
           decoration: InputDecoration(

                          label: Text('password'),
              prefixIcon:Icon( Icons.lock),
              suffixIcon: InkWell(child: Icon(RegisterCubit.get(context).suffix),onTap: (){
                RegisterCubit.get(context).changePasswordvisisbilkity();
              },),
              enabledBorder:const OutlineInputBorder(
                borderSide:BorderSide(color: Colors.white) ,
              
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.grey.shade400) ,
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
             ),
              
              
           ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width*.5,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                  child:Center(child:  TextButton(
                    onPressed: () {
                       if(formKey.currentState!.validate()){
                    print('asdasdasd');
                    RegisterCubit.get(context).logIn(email: emailcontroller.text, password: passcontroller.text);
                  }
                    },
                    child: Text('Log In',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),))),
                ),
             
              SizedBox(height: 20,),
              Row(
               
                children: [
                   SizedBox(width: 19,),
                  Text('you do not have an account'),
                  TextButton(onPressed: (){
     Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
                  }, child: Text('create account'))
                ],
              )
              ]),
         ),
       ),
     ),
    );
  }
}