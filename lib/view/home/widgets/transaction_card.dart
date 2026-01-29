
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: "https://m.media-amazon.com/images/I/614jckJYmiL._AC_UF350,350_QL80_.jpg",
                      height: context.screenHeight / 13,
                      width: context.screenHeight / 13,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Flexible(
                flex: 3,
                child: SizedBox(
                  height: context.screenHeight / 13,
                  child: Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .start,
                    children: [
                      Text("Antony Gonzales", style: TextStyleConstants.w500F16),
                      Text(
                        "Irure id do pariatur officia et irure nostrud.Irure id do pariatur officia et irure nostrud.",
                        style: TextStyleConstants.w400F12,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          "${StringConstants.rupeeIcon} -15",
          style: TextStyleConstants.w600F16.copyWith(color: const Color(0xFFCC392E)),
        )
      ],
    );
  }
}
