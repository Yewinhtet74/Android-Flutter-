import 'package:flutter/material.dart';

class Sliver_ extends StatefulWidget {
  const Sliver_({super.key});

  @override
  State<Sliver_> createState() => _Sliver_State();
}

class _Sliver_State extends State<Sliver_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: Colors.black87,
            // title: Text('Sliver App Bar',style: TextStyle(color: Colors.white),),
            centerTitle: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver App Bar'),
              background: Image.asset('assets/bp.png',fit: BoxFit.cover,),
            ),
          ),
          // SliverList(delegate: SliverChildBuilderDelegate((context, index) => ListTile(title: Text('title'),),childCount: 20))
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: Colors.pink,
            ),
          ),SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: Colors.pink.shade300,
            ),
          ),SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: Colors.pink.shade200,
            ),
          ),
        ],
      ),
    );
  }
}