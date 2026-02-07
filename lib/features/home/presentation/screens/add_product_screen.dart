import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/function/pick_image.dart';
import 'package:grocery/core/common/function/show_snake_bar.dart';
import 'package:grocery/core/common/shared_widget.dart/loader.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/presentation/bloc/product_bloc.dart';
import 'package:grocery/features/home/presentation/widgets/category_drop_down.dart';
import 'package:grocery/features/home/presentation/widgets/product_image_select.dart';
import 'package:uuid/uuid.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();

  String? selectedCategory;

  List<String> imageProducts = [];

  File? image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is PostProductsuccess) {
          showSnackBar(context, "Product Added Successfully");
          AppRoutes.router.pop();
        }
        if (state is PostProductFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: Text('Add Product', style: Styles.bold24Black),
            backgroundColor: AppColors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  image != null
                      ? ImageSelected(onTap: () => selectImage(), image: image)
                      : ImageNotSelected(onTap: () => selectImage()),
                  verticalSpacing(30),
                  // اسم المنتج
                  TextFormField(
                    controller: _productNameController,
                    decoration: const InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter product name'
                        : null,
                  ),
                  verticalSpacing(16),
                  // السعر
                  TextFormField(
                    controller: _productPriceController,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter price' : null,
                  ),
                  verticalSpacing(16),
                  CategoryDropdown(
                    onChanged: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      selectedCategory = value;
                    },
                    validator: (value) => value == null || value.isEmpty
                        ? "Enter Category"
                        : null,
                  ),

                  verticalSpacing(30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),

                      backgroundColor: AppColors.lightYellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate() && image != null) {
                        _submit();
                      }
                    },
                    child: state is PostProductLoading
                        ? const Loader()
                        : Text('Save Product', style: Styles.bold16Black),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  double? checkPriceFormate(String price) {
    if (price.isEmpty) {
      return null;
    }

    if (double.tryParse(price) == null) {
      return null;
    }
    return double.tryParse(price);
  }

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  String? checkImage() {
    if (image == null) {
      return 'Please select an image';
    }
    return null;
  }

  void _submit() {
    final price = checkPriceFormate(_productPriceController.text.trim());
    if (price == null) {
      showSnackBar(context, "Please enter a valid price");
      return;
    }
    if (_formKey.currentState!.validate() && checkImage() == null) {
      final product = ProductEntity(
        id: const Uuid().v4(), // Supabase هيعمل UUID تلقائي
        name: _productNameController.text.trim(),
        price: price,
        image: image!.path,
        categoryName: selectedCategory!,
        isFavourite: false,
        createdAt: DateTime.now(),
        imageFile: image,
      );
      if (!imageProducts.contains(product.image)) {
        context.read<ProductBloc>().add(
          PostProductEvent(productEntity: product),
        );

        imageProducts.add(product.image);
      }
    }
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productPriceController.dispose();
    super.dispose();
  }
}
