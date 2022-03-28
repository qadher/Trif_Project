import 'package:flutter/material.dart';

 Container adsBanner(BuildContext context) {
    return Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/b55c/4c5e/ad9cf257218c585edb1f4e91fec34d09?Expires=1649030400&Signature=IMICLQ4FrAKMOhuRK~3ORmTKnBL1a3h6wkfoXn1Gf24B7NkND7xBwUzMSyc4LMn~q8cs6lKXINojSYZBkqSbavpaePyaCzK3rqeMQGWgRjkz9PxqqvTBtjTtmS0zY25PNiITQE7HEQdH0r5rd3N2OZw3sDiQlKlN7b4c1yz3jClKKqfy32Gtdc5QGQK2QG4K5goj-~TshKC6tBN5zgU~NIl3CxXNjBjuKDSAW7vaFNJHW8YyG3tIQBrZp81858B4LfMjaOJfZADSv8rI1vlfaNDDElEkC5v5xu6FQ0LG9T281BKBO57oeh-pXcMWjiys--BDJT-YnqMaFj-j2skvEQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
  }