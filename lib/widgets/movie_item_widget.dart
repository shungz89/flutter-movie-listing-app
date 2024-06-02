import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_listing_app/api/api.dart';
import 'package:get/get.dart';
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
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
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

  @override
  bool get wantKeepAlive => true;
}
