import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gotraining/modules/motivometro/stores/motivometro_store.dart';
import 'package:provider/provider.dart';

class CarroselWidget extends StatefulWidget {
  const CarroselWidget({super.key});

  @override
  State<CarroselWidget> createState() => _CarroselWidgetState();
}

class _CarroselWidgetState extends State<CarroselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MotivometroStore>(context);
    return CarouselSlider(
      options: CarouselOptions(
        height: 130.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        viewportFraction: 0.70,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: store.fotosCarrosel.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = store.fotosCarrosel.indexOf(imageUrl);
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                // ignore: sort_child_properties_last
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset(imageUrl['image'].toString())),
                    Text(
                      imageUrl['title'].toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 200, 200, 200),
                  borderRadius: BorderRadius.circular(45.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          _currentIndex == store.fotosCarrosel.indexOf(imageUrl)
                              ? const Color.fromARGB(255, 150, 85, 215)
                                  .withOpacity(0.5)
                              : Colors.grey.withOpacity(0.5),
                      blurRadius: 8.0,
                      spreadRadius: 3.0,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
