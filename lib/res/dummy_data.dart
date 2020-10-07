import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';

const List<ProductModel> dummyProducts = [
  ProductModel(
    id: 0,
    imageLink: 'https://cdn.jpegmini.com/user/images/slider_puffin_jpegmini_mobile.jpg',
    galleryImagesLinks: [
      'https://ichef.bbci.co.uk/news/1024/cpsprodpb/67CF/production/_108857562_mediaitem108857561.jpg'
          'https://www.allaboutbirds.org/guide/assets/photo/64802871-480px.jpg',
    ],
    languages: {
      'HE': {
        'name': '#1 Name he',
        'description': '#1 Description he',
        'desc2': '#1 Description2 he',
        'points': [
          'point1',
          'point2',
          'point3'
        ]
      },
      'EN': {
        'name': '#1 Name  en',
        'description': '#1 Description  en',
        'desc2': '#1 Description2 en',
        'points': [
          'point1',
          'point2',
          'point3'
        ]
      }
    },
  ),
  ProductModel(
    id: 1,
    imageLink: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/close-up-of-cat-wearing-sunglasses-while-sitting-royalty-free-image-1571755145.jpg',
    galleryImagesLinks: [
      'https://static.scientificamerican.com/sciam/cache/file/F1E90F3D-1FFD-4BA9-9DFA98AE647FA7D4_source.jpg'
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/close-up-of-cat-wearing-sunglasses-while-sitting-royalty-free-image-1571755145.jpg',
    ],
    languages: {
      'HE': {
        'name': '#2 Name he',
        'description': '#2 Description he',
        'desc2': '#2 Description2 he',
        'points': [
          'point1',
          'point2',
          'point3'
        ]
      },
      'EN': {
        'name': '#2 Name  en',
        'description': '#2 Description  en',
        'desc2': '#2 Description2 en',
        'points': [
          'point1',
          'point2',
          'point3'
        ]
      }
    },
  ),
  ProductModel(
    id: 2,
    imageLink: 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg',
    galleryImagesLinks: [
      'https://cdn.mos.cms.futurecdn.net/JzqhuEDTRfCZKMKHUxPySB.jpg'
          'https://i.dailymail.co.uk/1s/2019/11/18/16/21162158-0-image-a-44_1574095086222.jpg',
    ],
    languages: {
      'HE': {
        'name': '#3 Name he',
        'description': '#3 Description he',
        'desc2': '#3 Description2 he',
        'points': [
          'point1',
          'point2',
          'point3'
        ]
      },
      'EN': {
        'name': '#3 Name  en',
        'description': '#3 Description  en',
        'desc2': '#3 Description2 en',
        'points': [
          'point1',
          'point2',
          'point3'
        ]
      }
    },
  ),
  ProductModel(
    id: 3,
    imageLink: 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.j   pg',
    galleryImagesLinks: [
      'https://cdn.mos.cms.futurecdn.net/JzqhuEDTRfCZKMKHUxPySB.jpg'
          'https://i.dailymail.co.uk/1s/2019/11/18/16/21162158-0-image-a-44_1574095086222.jpg',
    ],
    languages: {
      'HE': {
        'name': '#4 Name he',
        'description': '#4 Description he',
        'desc2': '#4 Description2 he',
        'points': [
          'point1',
          'point2',
          'point3'
        ]
      },
      'EN': {
        'name': '#4 Name  en',
        'description': '#4 Description  en',
        'desc2': '#4 Description2 en',
        'points': [
          'point1',
          'point2',
          'point3'
        ]
      }
    },
  ),
];

const List<FooterButtonModel> dummyButtons = [
  FooterButtonModel(
    type: 'HOME',
    iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/15/15730.svg',
    name: {'EN': 'Home'},
    list: [],
  ),
  FooterButtonModel(
    type: 'SETTINGS',
    iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/2099/2099058.svg',
    name: {'EN': 'Settings'},
    list: [],
  ),
  FooterButtonModel(
    type: 'SWITCH',
    iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/565/565619.svg',
    name: {'EN': 'Switch'},
    list: [
      FooterButtonModel(
        type: 'SETTINGS',
        iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/2099/2099058.svg',
        name: {'EN': 'Settings'},
        list: [],
      ),
      FooterButtonModel(
        type: 'LOGOUT',
        iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/1286/1286853.svg',
        name: {'EN': 'Logout'},
        list: [],
      ),
    ],
  ),
  FooterButtonModel(
    type: 'LOGOUT',
    iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/1286/1286853.svg',
    name: {'EN': 'Logout'},
    list: [],
  ),
];
