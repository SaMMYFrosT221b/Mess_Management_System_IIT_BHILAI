import 'package:flutter/material.dart';

class MenuCategoryItem extends StatelessWidget {
  const MenuCategoryItem({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ...items,
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);

  final String image, title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding around the card
      child: Card(
        elevation: 0, // Add some elevation for a subtle shadow
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding inside the card
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    8.0), // Add a border radius to the image
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius for desired roundness
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.black54),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight:
                              FontWeight.w600, // Make the title a bit bolder
                          fontSize: 18, // Increase the font size
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8), // Adjust padding
                        child: Text(
                          "Shortbread, chocolate turtle cookies, and red velvet.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          const Text("Mess: "),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: CircleAvatar(
                              radius: 2,
                              backgroundColor: Colors.black38,
                            ),
                          ),
                          const Text("Kumar"),
                          const Spacer(),
                          Text(
                            "IND \₹${price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight
                                  .w600, // Make the price a bit bolder
                              color: Color(0xFF22A45D),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
