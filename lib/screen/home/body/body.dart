import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _primaryGradient = LinearGradient(
  colors: [
    Color(0xFF3E5871),
    Color(0xFF1B2E44),
  ],
);

const _secondaryGradient = LinearGradient(
  colors: [
    Color(0xFF344f66),
    Color(0xFF20344A),
  ],
);

const _centerCard = 70.0;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.menu_open,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          Icon(
            Icons.calendar_today_rounded,
            color: Colors.white,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: _centerCard / 2,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: _primaryGradient,
                    ),
                    child: _TopWidget(),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: _centerCard,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: _CenterWidget(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: _BottomWidget(),
          ),
        ],
      ),
    );
  }
}

class _BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Detail of movements',
              style: Theme.of(context).textTheme.headline6,
            ),
            _ListItemWidget(
              icons: Icons.restaurant_menu,
              title: 'Restaurant Manhattan',
              fecha: DateTime(2021, 6, 10),
              amount: -170,
            ),
            _ListItemWidget(
              icons: Icons.attach_money,
              title: 'Deposit Freenlace',
              fecha: DateTime(2021, 6, 7),
              amount: 800,
            ),
            _ListItemWidget(
              icons: Icons.attach_money,
              title: 'Central Market',
              fecha: DateTime(2021, 6, 6),
              amount: -50,
            ),
            _ListItemWidget(
              icons: Icons.attach_money,
              title: 'Salary Deposit',
              fecha: DateTime(2021, 6, 1),
              amount: 4200,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  const _ListItemWidget({
    Key? key,
    required this.amount,
    required this.title,
    required this.fecha,
    required this.icons,
  }) : super(key: key);

  final IconData icons;
  final String title;
  final DateTime fecha;
  final int amount;

  @override
  Widget build(BuildContext context) {
    final isNegative = amount < 10;
    final amountColor = isNegative ? Colors.red[800] : Colors.green;
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(icons),
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 12,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(fecha),
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '\$${amount.abs().toStringAsFixed(0)}',
              style: TextStyle(
                color: amountColor,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              isNegative ? Icons.arrow_upward : Icons.arrow_downward,
              color: amountColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black87,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _CenterItem(
                  text: 'Income',
                  amount: 9302,
                ),
                _CenterItem(
                  text: 'Expense',
                  amount: -2790,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterItem extends StatelessWidget {
  const _CenterItem({
    Key? key,
    required this.text,
    required this.amount,
  }) : super(key: key);

  final String text;
  final int amount;

  @override
  Widget build(BuildContext context) {
    final isNegative = amount < 0;
    final amountColor = isNegative ? Colors.red[800] : Colors.green;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 11,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Icon(
              isNegative ? Icons.arrow_upward : Icons.arrow_downward,
              color: amountColor,
            ),
            SizedBox(width: 5),
            Text(
              '\$${amount.abs().toStringAsFixed(0)}',
              // '\$$amount',
              style: TextStyle(
                color: amountColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Available Balance',
          style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 12,
          ),
        ),
        Text(
          '\$7,392.00',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.white,
              ),
        ),
        Text(
          'June 9, 2021',
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 12,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Card(
            elevation: 5,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: _secondaryGradient,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FittedBox(
                      child: Text(
                        '42012 3049 2800 9815',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EXPIRE - 02/22',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'CVC CODE - 230',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
