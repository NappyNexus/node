import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:node/Dashboard/Data/Models/contact.dart';
// import 'package:node/Styles/colors.dart';

class Overview extends ConsumerStatefulWidget {
  const Overview({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OverviewState();
}

class _OverviewState extends ConsumerState<Overview> {
  final List<String> items = [
    'Familia',
    'Amigos',
    'Conocidos',
    'Desconocidos',
  ];
  String? selectedValue;

  //Start Data Model
  List<Contact> contacts = [];
  Map<int, bool> selectedContacts = {};

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  void loadContacts() async {
    // Mock loading JSON (Replace with Supabase integration later)
    String data = '''
      [
        {
          "id": 1,
          "name": "John Doe",
          "profilePicture": "https://example.com/images/john_doe.jpg",
          "phoneNumber": "+1234567890",
          "tag": "Friend"
        },
        {
          "id": 2,
          "name": "Jane Smith",
          "profilePicture": "https://example.com/images/jane_smith.jpg",
          "phoneNumber": "+0987654321",
          "tag": "Mother"
        }
      ]
    ''';

    List<dynamic> jsonResult = jsonDecode(data);
    setState(() {
      contacts = jsonResult.map((json) => Contact.fromJson(json)).toList();
    });
  }

  //End Data Model

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 97, 97),
      body: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  semanticsLabel: 'My SVG Image',
                  height: 70,
                  // width: 70,
                ),
              ),
              Text(
                'Node',
                style: GoogleFonts.inter(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          // First row of options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //first group
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            size: 25,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Contacts',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: 200,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          border: Border.all(
                            color: const Color(0xFF26282A),
                          ),
                          color: const Color(0xFF1A1C1E),
                        ),
                        elevation: 0,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                        ),
                        iconSize: 40,
                        iconEnabledColor: Colors.white,
                        // iconDisabledColor: Colors.blue,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xFF1A1C1E),
                        ),
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: WidgetStateProperty.all(6),
                          thumbVisibility: WidgetStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 250,
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Buscar contacto...',
                      ),
                    ),
                  )
                ],
              ),

              //Second Group
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.person_pin,
                    size: 50,
                  ),
                  Text(
                    'Fulanito de Tal',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ],
          ),

          //Next Row
          //Container Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //First Group
              Row(
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 25,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Todos los Contactos',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: 302,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          border: Border.all(
                            color: const Color(0xFF26282A),
                          ),
                          color: const Color(0xFF1A1C1E),
                        ),
                        elevation: 0,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                        ),
                        iconSize: 40,
                        iconEnabledColor: Colors.white,
                        // iconDisabledColor: Colors.blue,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xFF1A1C1E),
                        ),
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: WidgetStateProperty.all(6),
                          thumbVisibility: WidgetStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          // const Icon(
                          //   Icons.person,
                          //   size: 25,
                          //   color: Colors.white,
                          // ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            child: Text(
                              'Estatus',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: 150,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          border: Border.all(
                            color: const Color(0xFF26282A),
                          ),
                          color: const Color(0xFF1A1C1E),
                        ),
                        elevation: 0,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                        ),
                        iconSize: 40,
                        iconEnabledColor: Colors.white,
                        // iconDisabledColor: Colors.blue,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xFF1A1C1E),
                        ),
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: WidgetStateProperty.all(6),
                          thumbVisibility: WidgetStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ],
              ),

              //Second Group
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Nuevo Contacto'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.blue,
                      )),
                ],
              )
            ],
          ),

          // Table Over Bar
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      "3 contactos seleccionados",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle Edit action
                      },
                      child: const Text(
                        "Edit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        // Handle Delete action
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        // Handle Select all action
                      },
                      child: const Text(
                        "Select all 930 entries",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Table
          SingleChildScrollView(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Select')),
                DataColumn(label: Text('Profile')),
                DataColumn(label: Text('Phone Number')),
                DataColumn(label: Text('Tag')),
              ],
              rows: contacts.map((contact) {
                return DataRow(cells: [
                  DataCell(
                    Checkbox(
                      value: selectedContacts[contact.id] ?? false,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedContacts[contact.id] = value ?? false;
                        });
                      },
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(contact.profilePicture),
                        ),
                        SizedBox(width: 8),
                        Text(contact.name),
                      ],
                    ),
                  ),
                  DataCell(Text(contact.phoneNumber)),
                  DataCell(Text(contact.tag)),
                ]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
