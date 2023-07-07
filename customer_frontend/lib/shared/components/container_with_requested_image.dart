import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:studio_projects/shared/service/image_service.dart';

class ImageContainer extends StatefulWidget {
  String endPointEnding;

  Color? containerBackgroundColor;
  BorderRadius? containerBorderRadius;
  Border? containerBorder;
  List<BoxShadow>? containerBoxShadow;
  Widget? containerChild;
  EdgeInsets? containerPadding;
  BoxFit? pictureBoxFit;

  ImageContainer(this.endPointEnding,
      {this.containerBackgroundColor,
      this.containerBorderRadius,
      this.containerBorder,
      this.containerBoxShadow,
      this.containerChild,
        this.containerPadding,
        this.pictureBoxFit
      });

  @override
  State<StatefulWidget> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  ImageProvider? _imageProvider;

  final ImageService _imageService = ImageService();

  Future<void> _fetchImage() async {
    await _imageService.getImage(widget.endPointEnding).then((Response response) {
      if (response.statusCode == 200) {
        setState(() {
          _imageProvider = MemoryImage(response.bodyBytes);
          precacheImage(_imageProvider!, context);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchImage();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.containerPadding == null ? EdgeInsets.zero : widget.containerPadding!,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: widget.containerBoxShadow,
            border: widget.containerBorder,
            borderRadius: widget.containerBorderRadius,
            color: Colors.black54.withOpacity(0),
            image: DecorationImage(
                fit: widget.pictureBoxFit ?? BoxFit.fitWidth, image: _imageProvider ?? AssetImage("assets/mahapro_logo.png"))),
        child: widget.containerChild,
      ),
    );
  }
}
