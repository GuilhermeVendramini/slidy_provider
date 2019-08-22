import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_bloc.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                'assets/images/avatar.png',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            _bloc.getUser != null
                ? Text(
                    _bloc.getUser.name,
                    style: TextStyle(fontSize: 18.0),
                  )
                : Container(),
            SizedBox(
              height: 20.0,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                _bloc.cleanUser();
/*                Route route = MaterialPageRoute(
                  builder: (context) => AppModule(),
                );
                Navigator.pushReplacement(context, route);*/
              },
            ),
          ],
        ),
      ),
    );
  }
}
