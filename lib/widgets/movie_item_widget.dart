import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_listing_app/api/api.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../models/result/get_movie_result.dart';
import '../models/sub_object.dart';

class UserItemWidget extends StatefulWidget {
  UserItemWidget(this.movieItem, {super.key, this.onTap});

  GetMovieResult movieItem;
  Function()? onTap;

  @override
  State<UserItemWidget> createState() => _UserItemWidgetState();
}

class _UserItemWidgetState extends State<UserItemWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        constraints: BoxConstraints(
          minHeight: 50,
        ),
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                color: Colors.black,
                child: CachedNetworkImage(
                  imageUrl: ApiConstants.imgUrl +
                      "" +
                      (widget.movieItem.posterPath ?? ""),
                  width: Get.width / 4,
                  fit: BoxFit.cover,
                  height: 112,
                  placeholder: (context, url) => Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    child: Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movieItem.originalTitle ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  widget.movieItem.overview ?? "",
                  style: TextStyle(
                    color: AppColors.darkGreyDark,
                    fontSize: 14,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(children: [
                  Text(
                    "Release Date:",
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    formatDate("${widget.movieItem.releaseDate ?? "-"}"),
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 14,
                    ),
                  ),
                ],),
                SizedBox(
                  height: 8,
                ),
              ],
            )),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
  }

  @override
  bool get wantKeepAlive => true;
}
