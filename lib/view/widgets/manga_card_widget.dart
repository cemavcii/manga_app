import 'package:flutter/material.dart';
import 'package:manga_app/core/extension/context_extension.dart';
import '../../core/router/app_router.dart';
import '../../model/manga_response_model.dart';
import '../manga_detail_view.dart';

class MangaCardWidget extends StatelessWidget {
  const MangaCardWidget(this.mangaList, this.index, {Key? key})
      : super(key: key);

  final List<Data> mangaList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter()
            .push(context, MangaDetailView(mangaDetails: mangaList[index]));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
            alignment: Alignment.bottomCenter,
            children: [_stackImage(), _stackText(context)]),
      ),
    );
  }

  SizedBox _stackImage() {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
        fit: BoxFit.fill,
        mangaList[index].images?.jpg?.imageUrl ?? '',
      ),
    );
  }

  Container _stackText(BuildContext context) {
    return Container(
      padding: context.paddingHorizontalLow,
      height: context.dynamicHeight(0.08),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      child: Center(
        child: Text(
          mangaList[index].title ?? '',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white),
          maxLines: 2,
        ),
      ),
    );
  }
}