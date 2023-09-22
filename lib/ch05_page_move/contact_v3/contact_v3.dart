import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'page_contact_list.dart';
import 'page_contact_detail.dart';

class ContactsDemoV3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactListPage(),
      onGenerateRoute: (RouteSettings settings) {
        if(ContactDetailPage.routeName == settings.name) {
          Contact contact = settings.arguments as Contact;
          return MaterialPageRoute(
            builder: (context) => ContactDetailPage(contact)
          );
        }

        return _noWay;
      }
    );
  }

  final MaterialPageRoute _noWay = MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(child: Text('You\' at dead end'))
    )
  );
}

void main() => runApp(ContactsDemoV3());