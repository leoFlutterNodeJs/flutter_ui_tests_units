import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/svg/icons/search.svg',
            width: 15,
            color: Colors.grey,
          ),
          SizedBox(width: 10),
          Text(
            'Find your food',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
