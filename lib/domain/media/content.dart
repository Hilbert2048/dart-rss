import 'package:dart_rss/domain/media/category.dart';
import 'package:dart_rss/domain/media/credit.dart';
import 'package:dart_rss/domain/media/description.dart';
import 'package:dart_rss/domain/media/rating.dart';
import 'package:dart_rss/domain/media/thumbnail.dart';
import 'package:dart_rss/domain/media/title.dart';
import 'package:dart_rss/util/helpers.dart';
import 'package:xml/xml.dart';

class Content {
  factory Content.parse(XmlElement element) {
    return Content(
      url: element.getAttribute('url'),
      type: element.getAttribute('type'),
      fileSize: int.tryParse(element.getAttribute('fileSize') ?? '0') ?? 0,
      medium: element.getAttribute('medium'),
      isDefault: element.getAttribute('isDefault') == 'true',
      expression: element.getAttribute('expression'),
      bitrate: int.tryParse(element.getAttribute('bitrate') ?? '0') ?? 0,
      framerate: double.tryParse(element.getAttribute('framerate') ?? '0') ?? 0,
      samplingrate:
          double.tryParse(element.getAttribute('samplingrate') ?? '0') ?? 0,
      channels: int.tryParse(element.getAttribute('channels') ?? '0') ?? 0,
      duration: int.tryParse(element.getAttribute('duration') ?? '0') ?? 0,
      height: int.tryParse(element.getAttribute('height') ?? '0') ?? 0,
      width: int.tryParse(element.getAttribute('width') ?? '0') ?? 0,
      lang: element.getAttribute('lang'),
      thumbnails: element
          .findElements('media:thumbnail')
          .map((e) => Thumbnail.parse(e))
          .toList(),
      title: Title.parse(findElementOrNull(element, 'media:title')),
      description:
          Description.parse(findElementOrNull(element, 'media:description')),
      credits: element
          .findElements('media:credit')
          .map((e) => Credit.parse(e))
          .toList(),
      category: Category.parse(findElementOrNull(element, 'media:category')),
      rating: Rating.parse(findElementOrNull(element, 'media:rating')),
    );
  }

  const Content({
    this.url,
    this.type,
    this.fileSize = 0,
    this.medium,
    this.isDefault,
    this.expression,
    this.bitrate = 0,
    this.framerate = 0,
    this.samplingrate = 0,
    this.channels = 0,
    this.duration = 0,
    this.height = 0,
    this.width = 0,
    this.lang,
    this.thumbnails = const <Thumbnail>[],
    this.title,
    this.description,
    this.credits = const <Credit>[],
    this.category,
    this.rating,
  });

  final String? url;
  final String? type;
  final int fileSize;
  final String? medium;
  final bool? isDefault;
  final String? expression;
  final int bitrate;
  final double framerate;
  final double samplingrate;
  final int channels;
  final int duration;
  final int height;
  final int width;
  final String? lang;
  final List<Thumbnail> thumbnails;
  final Title? title;
  final Description? description;
  final List<Credit> credits;
  final Category? category;
  final Rating? rating;
}
