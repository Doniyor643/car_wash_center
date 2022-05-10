import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  static const String id = "services";
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {

  Query query = FirebaseDatabase.instance.ref('Davron').child('CarWashCenter').child('Services');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black87,
        title: const Text("Buyurtma berish",style: TextStyle(
            fontSize: 30,
            color: Colors.green,
            fontWeight: FontWeight.w400
        ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/auto.png"),
                fit: BoxFit.cover
            )
        ),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: FirebaseAnimatedList(
            query: query,
            itemBuilder: (
                BuildContext context,
                DataSnapshot snapshot,
                Animation<double> animation,
                int index){
              Map? contact = snapshot.value as Map?;
              return buildContactItem(service: contact);
            },
          ),
        )
      ),
    );
  }

  Widget buildContactItem({Map? service}) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(service!['url'].toString()),
              fit: BoxFit.cover
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            color: Colors.black87,
            child: ExpansionTile(
              title: Text(service['name'],style: const TextStyle(color: Colors.white,fontSize: 20),),
              subtitle: Text(service['price']+" so'm",style: const TextStyle(color: Colors.white,fontSize: 15),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(service['text'],style: const TextStyle(color: Colors.white,fontSize: 15),),
                )
              ],

            ),
          )
        ],),
    );




  }

}
