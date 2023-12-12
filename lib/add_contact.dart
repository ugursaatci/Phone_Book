import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;

  AddContact({required this.onSave});

  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  String _name = '';
  String _phone = '';
  String _email = '';
  String _image = 'assets/profile_picture.png';

  void _saveContact() {
    widget.onSave({
      'name': _name,
      'phone': _phone,
      'email': _email,
      'image': _image,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(_image),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Phone'),
              onChanged: (value) {
                setState(() {
                  _phone = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveContact,
        tooltip: 'Save',
        child: Icon(Icons.save),
      ),
    );
  }
}
