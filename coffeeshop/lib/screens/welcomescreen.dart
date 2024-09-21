import 'package:coffeeshop/util/coffee_tile.dart';
import 'package:coffeeshop/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {

  final List coffeetype = [
    [
      "Cappucino",
      true,
    ],
    [
      "Latte",
       false,
    ],
    [
      "Black",
      false,
    ],
    [
      "Tea",
      false,
    ],
  ];

  void coffeeTypeSelected(int index){
    setState(() {
      for(int i = 0; i < coffeetype.length; i++){
        coffeetype[1][1] = false;
      }
      coffeetype[index][1] = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),  
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[  // Corrected here
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: " ",
          ),
        ],
     ),
      body: Column(children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Text(
          "Find the best coffee for you",
          style: GoogleFonts.bebasNeue(
            fontSize: 50,
            color: Colors.white,
          ),
          ),
        ),
        SizedBox(height: 10),
        
        Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Find your coffee..",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600), 
           ),
          ),
        ),
      ),
      SizedBox(height: 20),

      Container(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: coffeetype.length,
          itemBuilder: (context, index){
          return CoffeeType(
            coffeetype: coffeetype[index][0],
            isSelected: coffeetype[index][1],
            ontap: (){
              coffeeTypeSelected(index);
            },
          );
        })
    ),

      Expanded(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CoffeeTile(
              coffeeImagePath: "lib/images/latte.jpg",
              coffeeName: "Latte",
              coffeeprice: "4.20",
            ),
            CoffeeTile(
              coffeeImagePath: "lib/images/Cappuccino.jpg",
              coffeeName: "Cappucino",
              coffeeprice: "4.10",
            ),
            CoffeeTile(
              coffeeImagePath: "lib/images/milk.jpg",
              coffeeName: "Milk Coffee",
              coffeeprice: "4.60",
            ),
          ],
        ),),
      ],
      ),
    );
  }
}