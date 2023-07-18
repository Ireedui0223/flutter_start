import "package:flutter/material.dart";
import "package:flutter_start/datamanager.dart";
import "package:flutter_start/datamodel.dart";

class MenuPage extends StatelessWidget {
  final DataManager dataManager;

  const MenuPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dataManager.getMenu(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categories = snapshot.data!;
            return ListView.builder(
                itemCount: categories.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(categories[index].name),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: categories[index].product.length,
                          itemBuilder: (context, prodIndex) {
                            var product = categories[index].product[prodIndex];
                            return ProductItem(
                              product: product,
                              onAdd: (addedProduct) {
                                dataManager.cartAdd(addedProduct);
                              },
                            );
                          })
                    ],
                  );
                }));
          } else {
            if (snapshot.hasError) {
              return const Text("error occured");
            } else {
              return const CircularProgressIndicator();
            }
          }
        });
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product.imageUrl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '\$${product.price.toStringAsFixed(2)}',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        onAdd(product);
                      },
                      child: const Text("click")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
