import 'package:flutter/material.dart';

class IncomeStatementPage extends StatelessWidget {
  const IncomeStatementPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compte de résultat"),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
              const Align( 
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Produits d\'exploitation (I)', style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold, 
                    fontSize: 20.0),),
                ) 
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Align( 
                    alignment: Alignment.topRight,
                    child: Text(' - Production vendue :', style: TextStyle(fontSize: 15.0),),
                  ),
                  Align( 
                    alignment: Alignment.centerRight,
                    child: Text('10 000€ ', style: TextStyle(fontSize: 15.0),),
                  )
              ],),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                    ),
                    child: const Align( 
                      alignment: Alignment.bottomRight,
                      child: Text('TOTAL : 10 000€ ', style: TextStyle(fontSize: 15.0,),),
                    ),
                  )
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                const Align( 
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 50),
                    child: Text('Charges d\'exploitation (II)', style: TextStyle(
                      decoration: TextDecoration.underline, 
                      fontWeight: FontWeight.bold, 
                      fontSize: 20.0),),
                  ) 
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Align( 
                    alignment: Alignment.topRight,
                    child: Text(' - Achats et charges :', style: TextStyle(fontSize: 15.0),),
                  ),
                  Align( 
                    alignment: Alignment.centerRight,
                    child: Text('0€ ', style: TextStyle(fontSize: 15.0),),
                )
              ],),
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                    ),
                    child: Align( 
                      alignment: Alignment.bottomRight,
                      child: Text('TOTAL : 0€ ', style: TextStyle(fontSize: 15.0,),),
                    ),
                  )
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.blueGrey.shade100,
              border: Border.all()),
              child: const Align( 
                alignment: Alignment.bottomRight,
                child: Text('Résultat d\'exploitation (I) - (II) :   10 000€ ', style: TextStyle(fontSize: 15.0),),
              ) 
            ),
          )
        ],
      ) 
      )
      
      
    );
  }
}