import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyBills extends StatefulWidget {
  const MyBills({super.key});
  @override
    _MyBillsState createState() => _MyBillsState();
}

class _MyBillsState extends State<MyBills> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('bills').snapshots();

  @override
    Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Mes factures"),
          ),
          body: Column(children: <Widget> [
                _billsTableHeader(context),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Table(
                  columnWidths: _tableColumnWidths,     
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return TableRow(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 50,
                              child: Text(data['number'], style: TextStyle(fontSize: 18.0),),
                              ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 50,
                              child: Text(data['date'], style: TextStyle(fontSize: 18.0),),
                              ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(data['amountHT'] + ' €', style: TextStyle(fontSize: 18.0),),
                              ),
                            SizedBox(
                                height: 50,
                                child: TextButton(
                                  onPressed: () => {
                                    context.goNamed('/edit-bill',
                                    pathParameters: <String, String> {'id': document.id}
                                    )}, 
                                  child: const Text('Modifier', style: TextStyle(fontSize: 16.0),)
                                ),
                              ),
                          ]
                        );
                  }).toList(),
                ),
              )
          ],),
      );
      }
    );
  }

  Widget _billsTableHeader(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Table(
                      columnWidths: _tableColumnWidths,
                      children: [
                          TableRow(
                          children: [
                            _containerHeader(Alignment.bottomLeft, "ID"),
                            _containerHeader(Alignment.bottomLeft, "Date"),
                            _containerHeader(Alignment.bottomCenter, "Montant TTC"),
                            const Text(""),
                          ]
                      )
                      ],
                  )
                );
  }

  Container _containerHeader(Alignment alignment, String name) {
    return Container(
      alignment: alignment,
      height: 50,
      child: Text(name, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
    );
  }

  final Map<int, TableColumnWidth> _tableColumnWidths = { 0: const FlexColumnWidth(2), 1: const FlexColumnWidth(6), 
  2: const FlexColumnWidth(8), 3: const FlexColumnWidth(5)};
}