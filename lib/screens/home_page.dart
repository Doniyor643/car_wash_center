import 'package:car_wash_center/screens/add_services.dart';
import 'package:car_wash_center/screens/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black38,
        title: const Text('C.W.C',style: TextStyle(
            fontSize: 30,
          color: Colors.red
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, AddServices.id);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white12,
        child: Column(children: [
          Container(
            height: 1,
            width: 300,
            color: Colors.cyan,
          ),
          const SizedBox(height: 50,),
          const Text('C.W.C',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 65,
              color: Colors.cyanAccent
          ),),
          const Text('Avtomobil yuvish markazi',style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
              color: Colors.cyanAccent
          ),),
          const SizedBox(height: 50,),
          Container(
            height: 1,
            width: 300,
            color: Colors.cyan,
          ),
          const SizedBox(height: 30,),
          // Yangiliklar
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children: [
              const Icon(Icons.assistant_direction,color: Colors.cyan,),
              const SizedBox(width: 10,),
              TextButton(
                onPressed: (){},
                child: Text('Yangiliklar',style: TextStyle(
                  fontSize: 20,
                  color: Colors.cyanAccent
              ),),),
            ],),
          ),
          // Buyurtma berish
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children: [
              const Icon(Icons.shopping_cart,color: Colors.cyan,),
              const SizedBox(width: 10,),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, ServicesPage.id);
                },
                child: const Text('Buyurtma berish',style: TextStyle(
                    fontSize: 20,
                    color: Colors.cyanAccent
                ),),
              ),
            ],),
          ),
          // Sozlamalar
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children: [
              const Icon(Icons.settings_rounded,color: Colors.cyan,),
              const SizedBox(width: 10,),
              TextButton(
                onPressed: (){},
                child: const Text('Sozlamalar',style: TextStyle(
                  fontSize: 20,
                  color: Colors.cyanAccent
              ),),),
            ],),
          )
        ],),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/auto1.jpg"),
              fit: BoxFit.cover
            )
        ),

      ),
    );
  }
}
