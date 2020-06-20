import 'package:flutter/material.dart';


class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {

  final Color disneyColor = Color.fromRGBO(10, 8, 44, 1);
  final Color netflixColor = Colors.black;
  final Color spotifyColor = Color.fromRGBO(0, 215, 85, 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tileHeight = MediaQuery.of(context).size.height/8;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        leading: Icon(Icons.settings),
        title: Text('Subscriptions'),
        actions: <Widget>[
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Icon(Icons.calendar_today)),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Icon(Icons.add_circle)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Stack(fit: StackFit.expand,
          children: <Widget>[
            Container(child: ListView(children: <Widget>[
              buildTrialListItem(
                  imageName: 'netflix',
                  title: 'Netflix',
                  color: netflixColor,
                  date: '30 MAY',
                  height: tileHeight),
              buildDisneyListItem(
                  imageName: 'disney',
                  title: 'Disney Plus',
                  color: disneyColor,
                  date: '28 MAY',
                  height: tileHeight),
              buildTrialListItem(
                  imageName: 'spotify',
                  title: 'Spotify',
                  color: spotifyColor,
                  date: '30 JUL',
                  height: tileHeight),
            ],),padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15
            ),),
            Align(alignment: Alignment.bottomCenter, child: Container(
              child: getBottomSnackBar(MediaQuery.of(context).size.height/7),
            ),),
          ],
        ),
      ),
    );
  }

  Widget buildTrialListItem({String imageName, String title, Color color, String date,double height}) {

    return Padding(padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          leading: Image.asset('assets/$imageName.png',fit: BoxFit.cover,),
          title: Center(child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
          trailing: Column(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
            Text(date,style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.only(top: 7),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: Color.fromRGBO(255, 67, 0, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('Trial Period',style: TextStyle(color: Colors.white)),
              ),
            )
          ],),
        ),
      ),
    );

  }

  Widget buildDisneyListItem({String imageName, String title, Color color, String date,double height}) {

    return Padding(padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        padding: EdgeInsets.only(right: 10),
        child: ListTile(
          leading: Image.asset('assets/$imageName.png',fit: BoxFit.cover,),
          title: Center(child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
          trailing: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
            Text(date,style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.only(top: 7),child: Text('\$ 22.00',style: TextStyle(color: Colors.white),)),
          ],),
        ),
      ),
    );

  }

  Widget getBottomSnackBar(double height) {

    return Container(
      height: height,width: double.maxFinite, padding: EdgeInsets.all(20),color: Color.fromRGBO(33, 33, 33, 1),
      child: Padding(padding: EdgeInsets.only(left: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
          Text('Total Expenses (Per Month)',style: TextStyle(color: Colors.white.withOpacity(0.7)),),
          Padding(padding: EdgeInsets.only(top: 10),child: Text(
            '\$ 44.00',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),
          ),),
        ],),
      ),
    );

  }


}
