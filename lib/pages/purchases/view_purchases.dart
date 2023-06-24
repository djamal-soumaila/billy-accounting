import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPurchases extends StatefulWidget {
  const MyPurchases({super.key});
  @override
    _MyPurchasesState createState() => _MyPurchasesState();
}

class _MyPurchasesState extends State<MyPurchases> {
  final Stream<QuerySnapshot> _purchasesStream = FirebaseFirestore.instance.collection('company/yYVfoeT0XF2z3Pv4sXMK/purchases').snapshots();

  @override
    Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _purchasesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Mes achats"),
          ),
          body: Padding(
                padding: const EdgeInsets.all(15),
                child: Column( 
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return Container(
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
                        // padding: EdgeInsets.only(bottom: 50),
                        child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 50)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data['date'], style: TextStyle(fontSize: 15.0),),
                                Text(data['description'], style: TextStyle(fontSize: 15.0),),
                              ],
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () => {
                                    context.goNamed('/edit-purchase',
                                    pathParameters: <String, String> {'id': document.id}
                                    )}, 
                                  child: const Text('Modifier', style: TextStyle(fontSize: 15.0),)
                                ),
                                Text(data['amountTTC'] + ' €', style: TextStyle(fontSize: 18.0),),
                                ],
                              ),
                              // Padding(padding: EdgeInsets.only(bottom: 10)),
                          ]
                        ),
                        );


                  }).toList(),
                ),
              )
      );
      }
    );
  }
}