import 'package:flutter/material.dart';

class ValueAddedTaxPage extends StatelessWidget {
  const ValueAddedTaxPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TVA (T1)"),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const Align( 
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 5, top: 10),
              child: Text('Montant à reverser', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
            ) 
          ),
          Container( 
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border(bottom: BorderSide())),
            child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text('4 775 €', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),),
            ) 
          ),
          Padding( padding: EdgeInsets.only(top: 30, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Align( 
                    alignment: Alignment.topRight,
                    child:Text('Total TVA collectée ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
                ),
                Align( 
                  alignment: Alignment.centerRight,
                  child: Text('4 800 €', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                )
              ],
            ),
          ),
          for(int x = 1; x<4;x++)...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align( 
                  alignment: Alignment.topRight,
                  child: Text("  Facture 0$x/2023"),
                ),
                const Align( 
                  alignment: Alignment.centerRight,
                  child: Text('1 600 €',),
                )
              ],),
          ],
          Padding(padding: const EdgeInsets.only(top: 30, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Align( 
                        alignment: Alignment.topRight,
                        child:  Text('Total TVA déductible ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
                      ),
                      Align( 
                        alignment: Alignment.centerRight,
                        child: Text('25 €', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                      )
                    ],
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Align( 
                alignment: Alignment.topRight,
                child: Text(' TVA écran PC 32 pouces'),
              ),
              Align( 
                alignment: Alignment.centerRight,
                child: Text('20 €'),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Align( 
                alignment: Alignment.topRight,
                child:  Text(' TVA clavier PC'),
              ),
              Align( 
                alignment: Alignment.centerRight,
                child: Text('5 €'),
              )
            ],
          ),                    
        ],
      ),
      )
      
      
    );
  }
}