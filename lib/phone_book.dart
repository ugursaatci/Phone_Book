import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; 
import 'add_contact.dart';

class PhoneBook extends StatefulWidget {
  @override
  _PhoneBookState createState() => _PhoneBookState();
}

class _PhoneBookState extends State<PhoneBook> {
  List<Map<String, dynamic>> contacts = [
    {
      'name': 'Uğur İhsan Saatci',
      'phone': '5380574006',
      'email': 'saatciiugr@gmail.com',
      'image': 'assets/stockprofile.png',
    },
  ];

  void _addContact(Map<String, dynamic> contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Book'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Slidable( 
            actionPane: SlidableDrawerActionPane(),
            secondaryActions: [
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => _deleteContact(index), 
              ),
            ],
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(contacts[index]['image']),
              ),
              title: Text(contacts[index]['name']),
              subtitle: Text(contacts[index]['phone']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContact(
                onSave: _addContact,
              ),
            ),
          );
        },
        tooltip: 'Add Contact',
        child: Icon(Icons.add),
      ),
    );
  }
}
