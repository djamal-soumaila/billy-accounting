import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditBill extends StatefulWidget {
  final String id;
  const EditBill({super.key, required this.id});

  @override
  EditBillState createState() => EditBillState();
}


class EditBillState extends State<EditBill> {

  CollectionReference billsFirestore = FirebaseFirestore.instance.collection('bills');

  final numberController = TextEditingController();
  final dateController = TextEditingController();
  final amoutHTController = TextEditingController();
  final tvaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.id);
    billsFirestore.doc('J7n68INo0xIvZjXtZSVb').get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        numberController.text = documentSnapshot.get('number');
        dateController.text = documentSnapshot.get('date');
        amoutHTController.text = documentSnapshot.get('amountHT');
        tvaController.text = documentSnapshot.get('TVA');
      }
    });
  }

  Future<void> addBill() {
      return billsFirestore .add({
            'number': numberController.text,
            'date': dateController.text,
            'amountHT': amoutHTController.text,
            'TVA': tvaController.text
          })
          .then((value) => print("Bills Added"))
          .catchError((error) => print("Failed to add bill: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouvelle facture"),
      ),
      body: Column(
          children: <Widget>[ 
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("Numéro"),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  ),
                  controller: numberController,
              ),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("Date de la facture"),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  ),
                  controller: dateController,
              ),
              ),
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("Montant de la facture"),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  ),
                controller: amoutHTController,
              ),
              ),
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("TVA"),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  ),
                controller: tvaController,
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                child: ElevatedButton(
                  onPressed: () {
                    // addBill();
                    context.go('/my-bills');
                    }, 
                  child: const Text('Enregistrer')
                  ),
              ),
            ],
          )
    );
  }
}