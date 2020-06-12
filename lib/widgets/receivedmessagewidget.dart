import 'package:flutter/material.dart';


import 'mycircleavatar.dart';
class ReceivedMessagesWidget extends StatelessWidget {
  final String message;
  final String imageUrl;
  const ReceivedMessagesWidget({
    Key key,
    @required this.message, this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Container msg = Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                 color:  Color(0xFFFFEFEE),
                 borderRadius: BorderRadius.only(
                   topRight: Radius.circular(15.0),
                   bottomRight: Radius.circular(15.0),
                 )
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text('8:00 AM', style: TextStyle(color: Colors.blueGrey, fontSize: 12.0, fontWeight: FontWeight.w400),),

             SizedBox(height: 6.0,),
                 Text(message, style: TextStyle(color: Colors.blueGrey, fontSize: 16.0, fontWeight: FontWeight.w600),),

               ],
             ),
           )

             ],
       ),
    );

    return(Row(
      children: <Widget>[
        Expanded(
          child: msg,
        ),

        IconButton(
          icon: false ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: false ? Theme.of(context).primaryColor : Colors.blueGrey,
          onPressed: (){},
        ),
      ],
    )
    );
  }
}
