import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  Iterable<Contact> _contacts = [];

  refreshContacts() async {
    if(await Permission.contacts.request().isGranted == false) return;

    Iterable<Contact> contacts = await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      _contacts = contacts;
    });
  }

  Widget _buildRow(BuildContext context, int i) {
    Contact c = _contacts.elementAt(i);
    return ListTile(
      title: Text(c.displayName!),
      leading: (c.avatar != null && (c.avatar?.length??0) > 0) ?
          CircleAvatar(backgroundImage: MemoryImage(c.avatar!)) :
          CircleAvatar(child: Text(c.initials()))
    );
  }

  @override
  void initState() {
    super.initState();
    refreshContacts();
  }

  @override
  Widget build(BuildContext context) {
    return _contacts!=null ? ListView.builder(
      itemCount: _contacts.length,
      itemBuilder: _buildRow
    ): Center(child: CircularProgressIndicator());
  }
}

class ListViewDynamicApp extends StatelessWidget {
  static const String _title = '동적 ListView 위젯 데모';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: ContactListPage(),
      )
    );
  }
}

void main() => runApp(ListViewDynamicApp());