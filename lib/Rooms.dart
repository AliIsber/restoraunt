import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoraunt/cubit/Statesregister.dart';
import 'package:restoraunt/cubit/cubitregister.dart';
import 'package:restoraunt/models.dart/roommodel.dart';

// ignore: must_be_immutable
class RoomsScreen extends StatelessWidget {


  RoomsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){},
      builder: (context,state){
        return ListView.separated(
                itemBuilder: (context, i) =>roomItem(RegisterCubit.get(context).rooms[i]),
                
                  separatorBuilder: ((context, index) =>const Divider()),
                itemCount: RegisterCubit.get(context).rooms.length ,
              );
      },  
     
    );
  }
}


Widget roomItem(RoomModel room)=> 


Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
       mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
              radius: 40,
                backgroundImage: NetworkImage('${room.image}'),
                
              ),
            // Container(
            //   height: 100,
            //   width: 90,
            //   child: Image.network('https://media.istockphoto.com/id/1414488600/photo/smiling-woman-scanning-qr-code-on-a-product-while-buying-in-supermarket.webp?b=1&s=170667a&w=0&k=20&c=PQMwl2DCz2lliTLftQvyjR6idxUsxFxTZwoR90MU25Q=')),
              SizedBox(width: 20,),
              Column(
               
                mainAxisSize: MainAxisSize.min,
                children: [
                Text('${room.descryption}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                Text('${room.date}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey),)
              ],),
              SizedBox(width: 30,),
              Container(
                color: Colors.grey,
                child: TextButton(
                  onPressed: (){},
                  
                  child: Text('${room.price}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
        );
