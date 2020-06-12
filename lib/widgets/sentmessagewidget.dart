import 'package:flutter/material.dart';

class SentMessageWidget extends StatelessWidget {


  final String message;

  const SentMessageWidget({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Container msg = Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'anonymous',
              style: Theme.of(context).textTheme.caption,
            ),
          ),

          /*
           Container(
             constraints: BoxConstraints(
                 maxWidth: MediaQuery.of(context).size.width * .6),
             padding: const EdgeInsets.all(15.0),
             decoration: BoxDecoration(
               color: Colors.black26,
               borderRadius: BorderRadius.only(
                 topRight: Radius.circular(25),
                 bottomLeft: Radius.circular(25),
                 bottomRight: Radius.circular(25),
               ),
             ),
             child: Text(
               message,
               style: Theme.of(context).textTheme.body1.apply(
                     color: Colors.black87,
                   ),
             ),
           ),
           */
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0,),
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color:  Colors.orangeAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('8:00 AM', style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w400),),

                SizedBox(height: 6.0,),
                Text(message, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),),

              ],
            ),
          )

        ],
      ),
    );

    return msg;
  }
}
