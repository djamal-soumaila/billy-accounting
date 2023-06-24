import 'package:flutter/material.dart';

class LiabilitiesPage extends StatelessWidget {
  const LiabilitiesPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilan passif"),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const Align( 
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text('Capitaux propres', 
                style: TextStyle(decoration: TextDecoration.underline, fontSize: 20.0),),
            ) 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Align( 
                alignment: Alignment.topRight,
                child: Text(' - Capital social :', style: TextStyle(fontSize: 15.0),),
              ),
              Align( 
                alignment: Alignment.centerRight,
                child: Text('1 000 €', style: TextStyle(fontSize: 15.0),),
              )
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Align( 
                alignment: Alignment.topRight,
                child: Text(' - Résultat net :', style: TextStyle(fontSize: 15.0),),
              ),
              Align( 
                alignment: Alignment.centerRight,
                child: Text('10 000 €', style: TextStyle(fontSize: 15.0),),
              )
          ],), 
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                    ),
                    child: Align( 
                      alignment: Alignment.bottomRight,
                      child: Text(' 11 000 € ', style: TextStyle(fontSize: 15.0,),),
                    ),
                  )
                ),          
            const Align( 
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text('Provision pour risque et charge', 
                style: TextStyle(decoration: TextDecoration.underline, fontSize: 20.0),),
            ) 
          ),
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                    ),
                    child: Align( 
                      alignment: Alignment.bottomRight,
                      child: Text(' 0 € ', style: TextStyle(fontSize: 15.0,),),
                    ),
                  )
                ),          
            const Align( 
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text('Dette', 
                style: TextStyle(decoration: TextDecoration.underline, fontSize: 20.0),),
            ) 
          ),
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                    ),
                    child: Align( 
                      alignment: Alignment.bottomRight,
                      child: Text(' 0 € ', style: TextStyle(fontSize: 15.0,),),
                    ),
                  )
                ),      
          const Align( 
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('TOTAL : 11 000 €', style: TextStyle(fontSize: 15.0),),
            ) 
          ),
        ],
      ),
      )
    );
  }
}