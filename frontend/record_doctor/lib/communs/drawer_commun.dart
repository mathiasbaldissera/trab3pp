import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:record_doctor/constants/constant_path_assets.dart' as pathIcons;
import 'package:record_doctor/constants/constant_strings.dart' as labels;

import 'items_drawer.dart';

class DrawerCommun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              child: Image.asset(pathIcons.pathIconHospital),
            ),
          ),
          ListTileDrawer(
            title: labels.labelItemOneDrawer,
            leading: Container(
              child: Image.asset("assets/icon-patient.png"),
              height: 40,
            ),
          ),
          ListTileDrawer(
            title: labels.labelItemTwoDrawer,
            leading: Container(
              child: Image.asset("assets/medic.png"),
              height: 40,
            ),
          ),
          ListTileDrawer(
            title: labels.labelItemThreeDrawer,
            leading: Container(
              child: SvgPicture.asset("assets/people_sic.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
