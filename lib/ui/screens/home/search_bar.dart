import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchCon;
  final VoidCallback filterIconFn;
  final Function(String) onChangedFn;
  const SearchBar({
    Key? key,
    required this.searchCon,
    required this.filterIconFn,
    required this.onChangedFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "searchBar",
      child: Container(
        width: 388.w,
        height: 48.h,
        padding: EdgeInsets.only(left: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10.w,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svgs/search.svg',
              width: 20.w,
              fit: BoxFit.fitWidth,
            ),
            addW(10.w),
            // search field
            SizedBox(
              width: 300.w,
              child: CustomField(
                textCon: searchCon,
                hintText: 'Search here...',
                onChangedFn: onChangedFn,
              ),
            ),
            // filter icon
            InkWell(
              onTap: filterIconFn,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: 34.w,
                height: 34.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svgs/filter.svg',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
