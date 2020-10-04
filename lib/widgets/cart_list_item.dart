import 'package:flutter/material.dart';

class CartListItem extends StatefulWidget {
  const CartListItem(
      {Key key,
      @required this.name,
      @required this.price,
      @required this.imageURL,
      @required this.index,
      this.quantity,
      this.delete,
      this.update})
      : super(key: key);

  final String name;
  final double price;
  final String imageURL;
  final int index;
  final int quantity;
  final Function delete;
  final Function update;

  @override
  _CartListItemState createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            width: 80,
            height: 80,
            child: Image.asset(
              widget.imageURL,
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
              color: Colors.grey.shade200,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            right: 8,
                            top: 4,
                          ),
                          child: Text(
                            widget.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => widget.delete(
                            widget.index, widget.price, widget.quantity),
                        child: Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            right: 8,
                            top: 8,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            color: Color(0xff31354B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "x ${widget.quantity}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "\u20B9 ${widget.price}",
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (widget.quantity == 1) {
                                  widget.delete(widget.index, widget.price,
                                      widget.quantity);
                                } else {
                                  widget.update(
                                      widget.price, false, widget.index);
                                }
                              },
                              color: Colors.grey.shade700,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                '${widget.quantity}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  widget.update(
                                      widget.price, true, widget.index);
                                });
                              },
                              color: Colors.grey.shade700,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
