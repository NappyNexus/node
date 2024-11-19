import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:node/Styles/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Row(
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
          Row(
            children: [
              DropdownButton2<String>(
                isExpanded: true,
                hint: const Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
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
                  height: 50,
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.redAccent,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.yellow,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.redAccent,
                  ),
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
