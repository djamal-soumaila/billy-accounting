import 'package:flutter/material.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilan actif"),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const Align( 
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text('Banque CCP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
            ) 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Align( 
                alignment: Alignment.topRight,
                child: Text(' - Compte courant :', style: TextStyle(fontSize: 15.0),),
              ),
              Align( 
                alignment: Alignment.centerRight,
                child: Text('10 000€', style: TextStyle(fontSize: 15.0),),
              )
          ],),
          const Align( 
            alignment: Alignment.bottomRight,

            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('TOTAL : 10 000€', style: TextStyle(fontSize: 15.0),),
            ) 
          ),
        ],
      ),
      )
      
      
    );
  }
}