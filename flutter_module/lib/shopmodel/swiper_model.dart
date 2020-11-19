class SwiperModel {
  final int urlType;
  final String goodsId;
  final String imgUrl;
  final String image;
  final String mallCategoryName;
  final String mallCategoryId;

  SwiperModel(
      { this.urlType,
        this.goodsId,
        this.imgUrl,
        this.image,
        this.mallCategoryName,
        this.mallCategoryId
      });

  factory SwiperModel.fromJson(Map<String, dynamic> json) {
    return SwiperModel(
      urlType: json['urlType'],
      goodsId: json['goodsId'],
      imgUrl: json['imgUrl'],
      image: json['image'],
      mallCategoryName: json['mallCategoryName'],
      mallCategoryId:json['mallCategoryId'],
    );
  }
}
