import 'package:flutter/material.dart';

class CategoriesItemWidget extends StatefulWidget {
  final String name;
  final String imageUrl;
  final bool isSelected;

  const CategoriesItemWidget({Key key, this.name, this.imageUrl, this.isSelected}) : super(key: key);

  @override
  _CategoriesItemWidgetState createState() => _CategoriesItemWidgetState();
}

class _CategoriesItemWidgetState extends State<CategoriesItemWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.0 * 3, bottom: 20.0 * 2),
          width: size.width * 0.4,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: widget.isSelected ? Colors.redAccent.withOpacity(0.8) : Colors.redAccent.withOpacity(0.3),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topRight: Radius.circular(100.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20.0,
                offset: Offset(5, 15),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20 / 2, right: 20.0 * 3, top: 20),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            child: Image(
              width: size.width * 0.3,
              height: size.height * 0.2,
              image: AssetImage(widget.imageUrl),
            ),
          ),
        )
      ],
    );
  }
}
