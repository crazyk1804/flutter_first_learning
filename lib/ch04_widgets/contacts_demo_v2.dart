import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

import 'contacts_demo.dart';

// todo 책의 예제가 최신버전에선 돌아가지 않는다.
// todo flutter는 버전업 할때 이전 버전과의 호환성을 염두에 두지 않는듯 하다..

// class _ContactListePageState extends State<ContactListPage> {
//   Iterable<Contact> _contacts = [];
//
//   _refreshContacts() async {
//     Iterable<Contact> contacts = await ContactsService.getContacts(
//         withThumbnails: false
//     );
//     setState(() { _contacts = contacts; });
//   }
//
//   _checkPermissions() async {
//     await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
//     _refreshContacts();
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }