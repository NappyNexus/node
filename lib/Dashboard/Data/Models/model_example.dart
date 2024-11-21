// import 'package:imagepicker/image_picker.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'ag_image.g.dart';

// @JsonSerializable()
// class AgImage {
//   AgImage({
//     required this.id,
//     this.fileName,
//     this.link,
//     this.mimType,
//     this.file,
//   });

//   String id;
//   String? mimType;
//   String? fileName;
//   String? link;
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   XFile? file;

//   factory AgImage.fromJson(Map<String, dynamic> json) =>
//       $AgImageFromJson(json);

//   Map<String, dynamic> toJson() => _$AgImageToJson(this);
// }