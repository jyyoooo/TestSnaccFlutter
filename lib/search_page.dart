import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(16,10,16,0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //  const   Text(
              //       'Search Page',
              //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              //     ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Card(
                    color: Colors.greenAccent,
                    margin: const EdgeInsets.fromLTRB(0, 10, 5, 10),
                    child: SizedBox(
                      width: 130,
                      child: Center(
                          child: Text(
                        'whatever is here ${index + 1}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  itemCount: 10,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => ClipRect(
                    child: Card(
                      color: Colors.pink[200],
                      child: Center(
                        child: Text(
                          'whatever is here ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount:15,
                ),
              ),
            ]));
  }
}
