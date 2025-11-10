import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(  
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          
        ),
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(title: "Travelling", icon: Icons.travel_explore, color: Colors.green),
              HobbyCard(title: "Loving", icon: Icons.favorite),
              HobbyCard(title: "Sleeping", icon: Icons.bed),
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.skateboarding,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width:20),
                      Text(
                        "Skating",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {

  final String title;
  final IconData icon;
  final Color? color;


  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: color,
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(width:20),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
