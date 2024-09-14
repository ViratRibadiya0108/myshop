import 'package:flutter/material.dart';
import 'package:myshop/domain/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              product.thumbnail != null
                  ? Image.network(product.thumbnail!, fit: BoxFit.cover)
                  : const Placeholder(fallbackHeight: 200),

              const SizedBox(height: 16),

              Text(
                product.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              Text(
                "💵 Price: \$${product.price.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 20, color: Colors.green),
              ),
              const SizedBox(height: 8),

              Text(
                "💫 Discount: ${product.discountPercentage?.toStringAsFixed(2)}%",
                style: const TextStyle(fontSize: 18, color: Colors.redAccent),
              ),
              const SizedBox(height: 8),

              Text(
                "🏷️ Category: ${product.category}",
                style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
              const SizedBox(height: 8),

              Text(
                "📦 Stock: ${product.stock}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),

              Text(
                "🌟 Rating: ${product.rating}/5",
                style: const TextStyle(fontSize: 16, color: Colors.orange),
              ),
              const SizedBox(height: 16),

              Text(
                "${product.description}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Additional product details
              Text(
                "🏢 Brand: ${product.brand}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              Text(
                "SKU: ${product.sku}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),

              Text(
                "Weight: ${product.weight} grams",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),

              // Handle dimensions with null safety
              Text(
                "Dimensions: ${product.dimensions?.width?.toString() ?? 'N/A'} x ${product.dimensions?.height?.toString() ?? 'N/A'} x ${product.dimensions?.depth?.toString() ?? 'N/A'} cm",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              Text(
                "📄 Warranty Info: ${product.warrantyInformation ?? 'No warranty information available'}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              Text(
                "🚚 Shipping Info: ${product.shippingInformation ?? 'No shipping information available'}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              Text(
                "📦 Availability Status: ${product.availabilityStatus ?? 'Not available'}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Display reviews with null safety
              const Text(
                "📝 Reviews:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Check if reviews is not null before calling map
              if (product.reviews != null && product.reviews!.isNotEmpty)
                ...product.reviews!.map((review) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${review.reviewerName} (${review.rating}⭐)",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text("${review.comment}"),
                      const SizedBox(height: 4),
                      Text("📅 Date: ${review.date?.toLocal()}"),
                    ],
                  ),
                ))
              else
                const Text(
                  'No reviews available.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

              const SizedBox(height: 16),

              // Additional meta info with null safety
              Text(
                "📅 Created At: ${product.meta?.createdAt?.toLocal() ?? 'N/A'}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),

              Text(
                "🔄 Updated At: ${product.meta?.updatedAt?.toLocal() ?? 'N/A'}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),

              Text(
                "🔖 Barcode: ${product.meta?.barcode ?? 'N/A'}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),

              Text(
                "🔍 QR Code: ${product.meta?.qrCode ?? 'N/A'}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
