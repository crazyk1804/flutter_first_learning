import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'page_contact_detail.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  Iterable<Contact> _contacts = [];

  refreshContacts() async {
    if(await Permission.contacts.request().isGranted == false) return;
    Iterable<Contact> contacts = await ContactsService.getContacts(
      withThumbnails: true
    );
    setState(() {
      _contacts = contacts;
    });
  }

  Widget _buildRow(BuildContext context, int i) {
    Contact contact = _contacts.elementAt(i);
    return ListTile(
      leading: (contact.avatar!=null && (contact.avatar?.length??0)>0) ?
          CircleAvatar(backgroundImage: MemoryImage(contact.avatar!)) :
          CircleAvatar(child: Text(contact.initials())),
      title: Text(contact.displayName ?? ''),
      onTap: () => Navigator.pushNamed(
          context, ContactDetailPage.routeName,arguments: contact
      )
    );
  }

  @override
  void initState() {
    super.initState();
    refreshContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('this is the contacts')),
      body: _contacts.length >0 ?
          ListView.builder(
            itemCount: _contacts.length,
            itemBuilder: _buildRow,
          ) : Center(child: Text('No Contacts'))
    );
  }
}