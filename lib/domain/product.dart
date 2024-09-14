// import 'dart:convert';

// import 'package:myshop/core/a.dart';
import 'package:myshop/domain/dimensions.dart';
import 'package:myshop/domain/meta.dart';
import 'package:myshop/domain/review.dart';

class Product {
  final int id;
  final String title;
  final String? description;
  final String? category;
  final double price;
  final double? discountPercentage;
  final double? rating;
  final int stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String>? images;
  final String? thumbnail;

  Product({
    required this.id,
    required this.title,
    this.description,
    this.category,
    required this.price,
    this.discountPercentage,
    this.rating,
    required this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"] ?? 'Unknown Product',
        description: json["description"],
        category: json["category"],
        price: (json["price"] ?? 0).toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"] ?? 0,
        tags: json["tags"] != null
            ? List<String>.from(json["tags"].map((x) => x))
            : [],
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: json["dimensions"] != null
            ? Dimensions.fromJson(json["dimensions"])
            : null,
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        availabilityStatus: json["availabilityStatus"],
        reviews: json["reviews"] != null
            ? List<Review>.from(json["reviews"].map((x) => Review.fromJson(x)))
            : [],
        returnPolicy: json["returnPolicy"],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: json["meta"] != null ? Meta.fromJson(json["meta"]) : null,
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : [],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": tags != null ? List<dynamic>.from(tags!.map((x) => x)) : [],
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus": availabilityStatus,
        "reviews": reviews != null
            ? List<dynamic>.from(reviews!.map((x) => x.toJson()))
            : [],
        "returnPolicy": returnPolicy,
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta?.toJson(),
        "images": images != null ? List<dynamic>.from(images!.map((x) => x)) : [],
        "thumbnail": thumbnail,
      };
}
