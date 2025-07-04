import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store/Features/products/presentation/widgets/bottom_cart.dart';
import 'package:fake_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/models/product_model.dart';
import 'quantity_button.dart';
import 'quick_quantity.dart';

class ProductQuantityBottomSheet extends StatefulWidget {
  final Product product;
  final int maxQuantity;
  final int initialQuantity;
  final Function(int quantity)? onAddToCart;

  const ProductQuantityBottomSheet({
    super.key,
    required this.product,
    this.maxQuantity = 99,
    this.initialQuantity = 1,
    this.onAddToCart,
  });

  @override
  State<ProductQuantityBottomSheet> createState() =>
      _ProductQuantityBottomSheetState();
}

class _ProductQuantityBottomSheetState
    extends State<ProductQuantityBottomSheet> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateQuantity(int newQuantity) {
    if (newQuantity >= 1 && newQuantity <= widget.maxQuantity) {
      setState(() {
        _quantity = newQuantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPalettes.scaffoldBG,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade100,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: widget.product.image,
                        fit: BoxFit.cover,
                        errorWidget: (context, error, stackTrace) =>
                            Icon(Icons.image, color: Colors.grey.shade400),
                      )),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '₹${widget.product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.green.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.grey.shade200,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Max: ${widget.maxQuantity}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade300,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildQuantityButton(
                      icon: Icons.remove,
                      onPressed: () => _updateQuantity(_quantity - 1),
                      enabled: _quantity > 1,
                    ),
                    const SizedBox(width: 32),
                    Container(
                      width: 80,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.blue.shade400,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _quantity.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                    buildQuantityButton(
                      icon: Icons.add,
                      onPressed: () => _updateQuantity(_quantity + 1),
                      enabled: _quantity < widget.maxQuantity,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                quickQuantity(
                  maxQuantity: widget.maxQuantity,
                  quantity: _quantity,
                  updateQuantity: (newQty) => _updateQuantity(newQty),
                ),
              ],
            ),
          ),
          bottomButton(
              productPrice: widget.product.price,
              quantity: _quantity,
              context: context,
              onPressed: () {
                if (widget.onAddToCart != null) {
                  widget.onAddToCart!(_quantity);
                  Navigator.pop(context);
                }
              }),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
