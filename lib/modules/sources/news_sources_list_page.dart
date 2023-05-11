import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/modules/sources/news_source_bloc.dart';

class NewsSourcesPage extends StatelessWidget {
  String getLogo(String name) {
    return "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/$name.png/1024px-$name.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Sources'),
      ),
      body: BlocBuilder<NewsSourceBloc, NewsSourceState>(
        builder: (context, state) {
          if (state is SourceLoaded) {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              children: state.articles
                  .map(
                    (source) => GestureDetector(
                      onTap: () {
                        // Navigate to news articles page for this source.
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.network(
                              getLogo(source.id.toString()),
                              height: 64,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              source.name.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return const Center(
              child: Text("please wiat"),
            );
          }
        },
      ),
    );
  }
}
