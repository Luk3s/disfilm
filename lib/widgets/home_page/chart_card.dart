import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({
    @required this.label,
    @required this.coverImagePath,
    @required this.onTap,
    Key key,
  })  : assert(label != null),
        assert(coverImagePath != null),
        assert(onTap != null),
        super(key: key);

  final String label;
  final String coverImagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Material(
        child: Ink.image(
          image: AssetImage(coverImagePath),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4,
          fit: BoxFit.cover,
          child: InkWell(
            onTap: onTap,
            child: Align(
              alignment: Alignment(-.8, .8),
              child: Text(
                label,
                style: Theme.of(context).primaryTextTheme.display2.copyWith(
                  color: Colors.white,
                  shadows: const <Shadow>[
                    Shadow(
                      offset: Offset(3, 3),
                      blurRadius: 12,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
