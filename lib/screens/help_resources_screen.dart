
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpResourcesScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'We want to help you'
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15,),
          ListTile(
            onTap: ()  {
              _launchTelephone('+18002738255');
            },
            title: Text('Suicide Hotline'),
            subtitle: Text('+18002738255'),
          ),
          ListTile(
            onTap: () {
              _launchTelephone('+12812342326');
            },
            title: Text('Katy Connect'),
            subtitle: Text('(281) 234-2326'),
          ),
          ListTile(
            onTap: () {
              _launchTelephone('911');
            },
            title: Text('Emergency Response'),
            subtitle: Text('911'),
          ),
          ListTile(
            onTap: () {
              _launchTelephone('+12812374000');
            },
            title: Text('KatyISD Police Department'),
            subtitle: Text('(281) 237-4000'),
          ),
        ],
      ),
    );
  }

  _launchTelephone(String number) async {
    if (await canLaunch('tel:'+number)) {
      await launch('tel:'+number);
    }
    else {
      print('Error launching');
    }
  }
}