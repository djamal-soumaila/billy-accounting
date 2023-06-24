import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPurchase extends StatefulWidget {
  final String id;
  const EditPurchase({super.key, required this.id});

  @override
  EditPurchaseState createState() => EditPurchaseState();
}


class EditPurchaseState extends State<EditPurchase> {

  CollectionReference purchasesFirestore = FirebaseFirestore.instance.collection('company');

  final dateController = TextEditingController();
  final descriptionController = TextEditingController();
  final amoutTTCController = TextEditingController();
  final vatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.id);
    purchasesFirestore.doc('yYVfoeT0XF2z3Pv4sXMK/purchases/bebwF0phcdICuMrLEbqA').get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        dateController.text = documentSnapshot.get('date');
        descriptionController.text = documentSnapshot.get('description');
        vatController.text = documentSnapshot.get('VAT');
        amoutTTCController.text = documentSnapshot.get('amountTTC');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouvel achat"),
      ),
      body: Column(
          children: <Widget>[ 
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("Date de l'achat"),
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
              child: Text("Description"),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  ),
                  controller: descriptionController,
              ),
              ),              
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("Montant de la TVA"),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  ),
                controller: vatController,
              ),
              ),
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("Montant TTC"),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  ),
                controller: amoutTTCController,
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/my-purchases');
                    }, 
                  child: const Text('Enregistrer')
                  ),
              ),
            ],
          )
    );
  }
}