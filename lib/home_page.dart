import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int _selectedItemIndex = -1;
    final List<String> _choiceChipLabels = ['Sandwich', 'Burgers', 'Soft Drinks','Coffee','Chips','Burgers','Ice-Cream','Pop-Corn'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white60,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80, // Adjust the height as needed
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: _choiceChipLabels.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(_choiceChipLabels[index]),
                      selected: _selectedItemIndex == index,
                      onSelected: (selected) {
                        setState(() {
                          _selectedItemIndex = selected ? index : -1;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  bool isSquareAvatar = index % 2 == 0;
                  return ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(15,10,15,15),
                      title: isSquareAvatar
                          ? const Text(
                              'Pepsi',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )
                          : const Text('Veg Burger',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18)),
                      subtitle: isSquareAvatar
                          ? const Text(
                              '1 Can of pepsi of 500ml\n Total energy : 177 kcal')
                          : const Text(
                              '1 Veg burger patty\nTotal energy : 150 kcal'),
                      leading: isSquareAvatar
                          ? SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                  'assets\\images\\pepsi-cold-drink-500x500.png'),
                            )
                          : SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipOval(
                                  child: Image.asset(
                                      'assets\\images\\veg-burger-patty-500x500.png')),
                            ),
                      onTap: () {
                        _tapGesture(
                            context,
                            isSquareAvatar ? 'Pepsi' : 'Burger',
                            isSquareAvatar
                                ? '1 Can of pepsi of 500ml\nTotal energy : 177 kcal'
                                : '1 Veg burger patty\nTotal energy : 150 kcal',
                            '\$100',
                            index);
                      },
                      trailing: const Text('\$100',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey),));
                },
                separatorBuilder: (ctx, index) {
                  return const Divider(
                    color: Colors.grey,
                  );
                },
                itemCount: 31)
        )],
        )
      ));
  }

  void _tapGesture(
      BuildContext ctx, title, String content, String price, index) {
    bool isSquareAvatar = index % 2 == 0;
    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SizedBox(
              // width: 1500,
              child: Row(
                children: [
                  Image.asset(
                    isSquareAvatar
                        ? 'assets/images/pepsi-cold-drink-500x500.png'
                        : 'assets/images/veg-burger-patty-500x500.png',
                    width: 100,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(content),
                      const SizedBox(height: 20),
                      Text(price),
                    ],
                  ),
                ],
              ),
            ),
            // actions: [
            //   TextButton(
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       child: const Text("Close"))
            // ],
          );
        });
  }
}
