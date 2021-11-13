import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: Container(
              child: Image.asset('images/icon_user.png'),
            ),
            accountName: Text('Muhammad Zaim Maulana'), 
            accountEmail: Text('19650058@student.uin-malang.ac.id')),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Beranda'),
            onTap: (){
            },
          ),
          ListTile(
            leading: Icon(Icons.devices),
            title: Text('Technology'),
            onTap: (){
              
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Business'),
            onTap: (){
              
            },
          ),
          ListTile(
            leading: Icon(Icons.health_and_safety),
            title: Text('Healthy'),
            onTap: (){
              
            },
          ),
          ListTile(
            leading: Icon(Icons.sports),
            title: Text('Sports'),
            onTap: (){
              
            },
          ),
        ],
      ),
    );
  }
}