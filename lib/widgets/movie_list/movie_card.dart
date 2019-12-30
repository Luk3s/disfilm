import 'package:disfilm/core/app_config.dart';
import 'package:disfilm/core/assets.dart' as assets;
import 'package:disfilm/core/date_utils.dart' as dates;
import 'package:disfilm/core/string_utils.dart' as strings;
import 'package:disfilm/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    @required this.appConfig,
    @required this.movie,
    Key key,
  })  : assert(movie != null),
        assert(appConfig != null),
        super(key: key);

  final AppConfig appConfig;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: <Widget>[
          if (movie.backdropPath != null)
            FadeInImage(
              placeholder: const AssetImage(assets.moviePlaceholder),
              image: NetworkImageWithRetry(
                '${appConfig.imageBaseUrl}/${movie.backdropPath}',
              ),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
            )
          else
            Image.asset(
              assets.moviePlaceholder,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
            ),
          Positioned.fill(child: Container(color: Colors.black26)),
          Positioned(
            bottom: 12,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (movie.releaseDate != null)
                  Text(
                    dates.toFullDate(movie.releaseDate),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black87.withOpacity(.7),
              ),
              width: 52,
              height: 52,
              child: CircularPercentIndicator(
                radius: 44,
                lineWidth: 4,
                percent: movie.userRating / 100,
                center: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: <InlineSpan>[
                      TextSpan(
                        text: strings.round(
                          movie.userRating,
                          fractionDigits: 0,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.top,
                        child: Text(
                          '%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                backgroundColor: Colors.grey.withOpacity(.5),
                progressColor: Colors.green.withOpacity(.8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
