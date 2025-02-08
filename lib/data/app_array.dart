

import 'package:bloc_booking/common_path.dart';




class AppArray {
  List introData = [
    {
      "image": imageAssets.intro,
      "title": "Fully Automated Check-In",
      "desc":
      "Skip the hassle of manual check-ins. Our app takes care of everything for you with our fully automated check-in feature. Just book your flight, and we’ll handle the rest—no need to worry about missing check-in deadlines."
    },
    {
      "image": imageAssets.intro2,
      "title": "Flight Protection with",
      "desc":
      "We’ve partnered with AXA to offer you free, comprehensive travel insurance with every booking. Whether it's for unexpected cancellations, lost baggage, or medical emergencies, you can travel with peace of mind knowing you’re covered by one of the world’s most trusted insurance providers."
    },
    {
      "image": imageAssets.intro3,
      "title": "Stay Ahead with Price Prediction",
      "desc":
      "Never miss out on the best deals with our advanced price prediction feature. Paxpass uses cutting-edge algorithms to analyze trends and forecast the best times to book your flights, helping you save money with confidence."
    },
  ];


  List tripOption = [
    {"title": "One Way"},
    {"title": "Round trip"},
    {"title": "Multicity"}
  ];


  List<String> options = [
    'Economy',
    'Premium Economy',
    'Business',
    'First Class',
  ];


  List<String> couponBenefits = [
    '100% refundable ticket',
    'Free transfer of tickets',
    'Repatriation to home country',
    'Assistance for missed connecting flights',
    'Lost check-in luggage insurance'
  ];

  List searchResult = [
    {
      "airportName": "Seattle–Tacoma International Airport(SEA)",
      "cityName": "Seattle",
      "cityCode": "WA"
    },
    {
      "airportName": "Spokane International Airport",
      "cityName": "Seattle",
      "cityCode": "GEG"
    },
    {
      "airportName": "Walla Walla Regional Airport",
      "cityName": "Seattle",
      "cityCode": "ALW"
    },
    {
      "airportName": "Seattle–Tacoma International Airport(SEA)",
      "cityName": "Seattle WA",
      "cityCode": "WA"
    }
  ];

  List userSelectionOption = [
    {"title": "Adults", "icon": svgAssets.adult, "total": 1, "desc": "Age>16"},
    {
      "title": "Children",
      "icon": svgAssets.children,
      "total": 1,
      "desc": "Age 3-15"
    },
    {"title": "Infant", "icon": svgAssets.infant, "total": 0, "desc": "Age<2"}
  ];

  List<String> notificationBenefitCard = [
    "100% refundable ticket",
    "Free transfer of tickets",
    "Repatriation to home country",
    "Assistance for missed connecting flights",
    "Lost check-in luggage insurance"
  ];

  List flightBookCoupon = [
    {
      "title": "Free luggage insurance",
      "desc": "Morem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "title": "Free luggage insurance",
      "desc": "Morem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "title": "Free luggage insurance",
      "desc": "Morem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "title": "Free luggage insurance",
      "desc": "Morem ipsum dolor sit amet, consectetur adipiscing elit."
    }
  ];

  List flightList = [
    {
      "departTime": "18:30",
      "arrivalTime": "21:00",
      "depart": "SEA T1",
      "arrival": "LAX T1",
      "hours": "2h 30min",
      "totalStops": 1,
      "price": 0,
      "airlines": imageAssets.appLogo,
      "gate": "Gate 23",
      "airLines": "Airbus A320",
      "airLineType": "Economy",
      "airNumber": "DL 245",
      "departAirport": "Seattle–Tacoma Intl T1",
      "arrivalAirport": "Seattle–Tacoma Intl T1",
      "stops": [
        {
          "gate": "Gate 12",
          "airLines": "Airbus A320",
          "airLineType": "Economy",
          "hours": "2h",
          "airNumber": "DL 245",
          "departAirport": "Seattle–Tacoma Intl T1",
          "arrivalAirport": "Los Angeles Intl T1",
        }
      ]
    },
    {
      "departTime": "18:30",
      "arrivalTime": "21:00",
      "depart": "SEA T1",
      "arrival": "LAX T1",
      "hours": "2h 30min",
      "totalStops": 0,
      "price": 14,
      "airlines": imageAssets.appLogo,
      "gate": "Gate 23",
      "airLines": "Airbus A320",
      "airLineType": "Economy",
      "airNumber": "DL 245",
      "departAirport": "Seattle–Tacoma Intl T1",
      "arrivalAirport": "Los Angeles Intl T1",
    },
    {
      "departTime": "18:30",
      "arrivalTime": "21:00",
      "depart": "SEA T1",
      "arrival": "LAX T1",
      "hours": "2h 30min",
      "totalStops": 2,
      "price": 15,
      "airlines": imageAssets.appLogo,
      "gate": "Gate 23",
      "airLines": "Airbus A320",
      "airLineType": "Economy",
      "airNumber": "DL 245",
      "departAirport": "Seattle–Tacoma Intl T1",
      "arrivalAirport": "Los Angeles Intl T1",
      "stops": [
        {
          "gate": "Gate 23",
          "airLines": "Airbus A320",
          "airLineType": "Economy",
          "hours": "2h 30min",
          "airNumber": "DL 245",
          "departAirport": "Los Angeles Intl T1",
          "arrivalAirport": "Walla Walla Regional Airport",
        },
        {
          "gate": "Gate 23",
          "airLines": "Airbus A320",
          "airLineType": "Economy",
          "hours": "2h 30min",
          "airNumber": "DL 245",
          "departAirport": "Walla Walla Regional Airport",
          "arrivalAirport": "Spokane International Airport",
        }
      ]
    },
    {
      "departTime": "18:30",
      "arrivalTime": "21:00",
      "depart": "SEA T1",
      "arrival": "LAX T1",
      "hours": "2h 30min",
      "totalStops": 2,
      "price": 16,
      "airlines": imageAssets.appLogo,
      "gate": "Gate 23",
      "airLines": "Airbus A320",
      "airLineType": "Economy",
      "airNumber": "DL 245",
      "departAirport": "Seattle–Tacoma Intl T1",
      "arrivalAirport": "Spokane International Airport",
      "stops": [
        {
          "gate": "Gate 23",
          "airLines": "Airbus A320",
          "airLineType": "Economy",
          "hours": "2h 30min",
          "airNumber": "DL 245",
          "departAirport": "Seattle–Tacoma Intl T1",
          "arrivalAirport": "Los Angeles Intl T1",
        },
        {
          "gate": "Gate 23",
          "airLines": "Airbus A320",
          "airLineType": "Economy",
          "hours": "2h 30min",
          "airNumber": "DL 245",
          "departAirport": "Los Angeles Intl T1",
          "arrivalAirport": "Spokane International Airport"
        }
      ]
    },
    {
      "departTime": "18:30",
      "arrivalTime": "21:00",
      "depart": "SEA T1",
      "arrival": "LAX T1",
      "hours": "2h 30min",
      "totalStops": 0,
      "price": 16,
      "airlines": imageAssets.appLogo,
      "gate": "Gate 23",
      "airLines": "Airbus A320",
      "airLineType": "Economy",
      "airNumber": "DL 245",
      "departAirport": "Seattle–Tacoma Intl T1",
      "arrivalAirport": "Spokane International Airport",
    },
    {
      "departTime": "18:30",
      "arrivalTime": "21:00",
      "depart": "SEA T1",
      "arrival": "LAX T1",
      "hours": "2h 30min",
      "totalStops": 0,
      "price": 16,
      "airlines": imageAssets.appLogo,
      "gate": "Gate 23",
      "airLines": "Airbus A320",
      "airLineType": "Economy",
      "airNumber": "DL 245",
      "departAirport": "Seattle–Tacoma Intl T1",
      "arrivalAirport": "Spokane International Airport",
    },
    {
      "departTime": "18:30",
      "arrivalTime": "21:00",
      "depart": "SEA T1",
      "arrival": "LAX T1",
      "hours": "2h 30min",
      "totalStops": 0,
      "price": 16,
      "airlines": imageAssets.appLogo,
      "gate": "Gate 23",
      "airLines": "Airbus A320",
      "airLineType": "Economy",
      "airNumber": "DL 245",
      "departAirport": "Seattle–Tacoma Intl T1",
      "arrivalAirport": "Spokane International Airport",
    }
  ];

  List<String> sortByFilter = [
    fonts.bestFlight,
    fonts.price,
    fonts.departureTime,
    fonts.arrivalTime,
    fonts.duration
  ];
  List<String> filterBy = [
    fonts.any,
    fonts.nonStop,
    fonts.upToOneStop,
    fonts.upToTwoStop
  ];

  List<String> airLines = [
    fonts.delta,
    fonts.alaskaAirline,
    fonts.united,
    fonts.americanAirlines
  ];

  List flightFareList = [
    {
      "title": "Current: Basic Economy",
      "benefits": [
        {"icon": svgAssets.check, "benefit": "Personal item included"},
        {"icon": svgAssets.check, "benefit": "Paxpass benefit"},
        {"icon": svgAssets.euro, "benefit": "Select seat with a fee"},
        {"icon": svgAssets.euro, "benefit": "Checked bag for a fee"},
        {"icon": svgAssets.euro, "benefit": "Carry on bag for a fee"},
        {"icon": svgAssets.euro, "benefit": "Cancellation with a fee"}
      ]
    },
    {
      "title": "Economy",
      "price": "+USD\$321",
      "benefits": [
        {"icon": svgAssets.check, "benefit": "Personal item included"},
        {"icon": svgAssets.check, "benefit": "Paxpass benefit"},
        {"icon": svgAssets.check, "benefit": "1 checked bag included"},
        {"icon": svgAssets.check, "benefit": "1 carry-on bag included"},
        {"icon": svgAssets.euro, "benefit": "Select seat with a fee"},
        {"icon": svgAssets.euro, "benefit": "Cancellation with a fee"}
      ]
    },
    {
      "title": "Premium Economy",
      "price": "+USD\$421",
      "benefits": [
        {"icon": svgAssets.check, "benefit": "Personal item included"},
        {"icon": svgAssets.check, "benefit": "Paxpass benefit"},
        {"icon": svgAssets.check, "benefit": "1 checked bag included"},
        {"icon": svgAssets.check, "benefit": "1 carry-on bag included"},
        {"icon": svgAssets.euro, "benefit": "Select seat with a fee"},
        {"icon": svgAssets.dollar, "benefit": "Cancellation with a fee"}
      ]
    }
  ];

  dynamic selectedFare = {
    "title": "Current",
    "benefits": [
      {"icon": svgAssets.check, "benefit": "Personal item included"},
      {"icon": svgAssets.euro, "benefit": "Carry on bag for a fee"},
      {"icon": svgAssets.euro, "benefit": "Checked bag for a fee"}
    ]
  };

  List<String> country = [
    "France",
    "Belgium",
    "Italy",
    "Netherlands",
    "Portugal",
    "Spain"
  ];

  List countryByFaqAndContact = [
    {
      "title": "France",
      "faqList": [
        "Assurance Annulation - Français",
        "Assurance Bagages et Correspondance Manquée - Français"
      ],
      "desc":
      "For customer support, please contact us via phone. Monday - Friday (9:00 - 17:00). We speak English and French!",
      "contactList": [
        {"country": "Belgium - Belgique - Belgie", "phone": "+32 12345 2345"},
        {"country": "Netherlands - Nederland", "phone": "+32 12345 2345"},
        {"country": "France", "phone": "+32 12345 2345"},
        {"country": "Spain - España", "phone": "+32 12345 2345"},
        {"country": "Portugal", "phone": "+32 12345 2345"},
        {"country": "Italy - Italia", "phone": "+32 12345 2345"}
      ]
    },
    {
      "title": "Belgium",
      "faqList": [
        "Assurance Annulation - Français",
        "Assurance Bagages et Correspondance Manquée - Français",
        "Annuleringsverzekering - Nederlands",
        "Baggage en Gemiste aansluiting Verzekering - Nederlands"
      ]
    },
    {
      "title": "Italy",
      "faqList": [
        "Assicurazione Annullamento Viaggio - Italiano",
        "Assicurazione Bagaglio e Perdita Connessione - Italiano"
      ]
    },
    {
      "title": "Netherlands",
      "faqList": [
        "Annuleringsverzekering - Nederlands",
        "Baggage en Gemiste aansluiting Verzekering - Nederlands"
      ]
    },
    {
      "title": "Portugal",
      "faqList": [
        "Seguro de Viagem - Português",
        "Seguro de Bagagem e Conexão Aérea - Português"
      ]
    },
    {
      "title": "Spain",
      "faqList": [
        "Seguro de Cancelación - Español",
        "Seguro Equipaje y Perdida de Conexión - Español"
      ]
    }
  ];

  List oldTravelerUserList = [
    {
      "firstName": "Jane",
      "lastName": "Doe",
      "streetAddress": "352 E 69th St, Los Angeles",
      "zipCode": "90003",
      "birthdate": "23-2-1995",
      "gender": "Male",
      "country": "United States",
      "passportNumber": "788888888",
      "expiryDate": "28-6-2035",
      "isSave": true
    },
    {
      "firstName": "Jane",
      "lastName": "Doe",
      "streetAddress": "352 E 69th St, Los Angeles",
      "zipCode": "90003",
      "birthdate": "23-2-1995",
      "gender": "Male",
      "country": "United States",
      "passportNumber": "788888888",
      "expiryDate": "28-6-2035",
      "isSave": true
    },
    {
      "firstName": "Jane",
      "lastName": "Doe",
      "streetAddress": "352 E 69th St, Los Angeles",
      "zipCode": "90003",
      "birthdate": "23-2-1995",
      "gender": "Male",
      "country": "United States",
      "passportNumber": "788888888",
      "expiryDate": "28-6-2035",
      "isSave": true
    },
    {
      "firstName": "Jane",
      "lastName": "Doe",
      "streetAddress": "352 E 69th St, Los Angeles",
      "zipCode": "90003",
      "birthdate": "23-2-1995",
      "gender": "Male",
      "country": "United States",
      "passportNumber": "788888888",
      "expiryDate": "28-6-2035",
      "isSave": true
    },
    {
      "firstName": "Jane",
      "lastName": "Doe",
      "streetAddress": "352 E 69th St, Los Angeles",
      "zipCode": "90003",
      "birthdate": "23-2-1995",
      "gender": "Male",
      "country": "United States",
      "passportNumber": "788888888",
      "expiryDate": "28-6-2035",
      "isSave": true
    },
    {
      "firstName": "Jane",
      "lastName": "Doe",
      "streetAddress": "352 E 69th St, Los Angeles",
      "zipCode": "90003",
      "birthdate": "23-2-1995",
      "gender": "Male",
      "country": "United States",
      "passportNumber": "788888888",
      "expiryDate": "28-6-2035",
      "isSave": true
    },
    {
      "firstName": "Jane",
      "lastName": "Doe",
      "streetAddress": "352 E 69th St, Los Angeles",
      "zipCode": "90003",
      "birthdate": "23-2-1995",
      "gender": "Male",
      "country": "United States",
      "passportNumber": "788888888",
      "expiryDate": "28-6-2035",
      "isSave": true
    },
    {
      "firstName": "Jane",
      "lastName": "Doe",
      "streetAddress": "352 E 69th St, Los Angeles",
      "zipCode": "90003",
      "birthdate": "23-2-1995",
      "gender": "Male",
      "country": "United States",
      "passportNumber": "788888888",
      "expiryDate": "28-6-2035",
      "isSave": true
    },
    {
      "firstName": "Jane",
      "lastName": "Doe",
      "streetAddress": "352 E 69th St, Los Angeles",
      "zipCode": "90003",
      "birthdate": "23-2-1995",
      "gender": "Male",
      "country": "United States",
      "passportNumber": "788888888",
      "expiryDate": "28-6-2035",
      "isSave": true
    },
    {
      "firstName": "Jane",
      "lastName": "Doe",
      "streetAddress": "352 E 69th St, Los Angeles",
      "zipCode": "90003",
      "birthdate": "23-2-1995",
      "gender": "Male",
      "country": "United States",
      "passportNumber": "788888888",
      "expiryDate": "28-6-2035",
      "isSave": true
    }
  ];

  List seatStatusOption = [
    {"title": fonts.occupied, "color": appTheme.textBoxBorderGrey},
    {
      "title": fonts.empty,
      "color": appTheme.white,
      "borderColor": appTheme.lightGrey
    },
    {"title": fonts.selected, "color": appTheme.secondary}
  ];

  List flightSeatList = [
    {
      "title": "Business",
      "seats": List.generate(
          3,
              (index) => {
            "seatAB": List.generate(
                2,
                    (i) => {
                  "price": (i + 1) % 3 == 0 ? 25 : 0,
                  "isOccupied": index.isEven ? true : false
                }),
            "seatCD": List.generate(
                2,
                    (i) => {
                  "price": (i + 1) % 3 == 0 ? 25 : 0,
                  "isOccupied": index.isEven ? true : false
                }),
            "seatNo": 0
          }),
    },
    {
      "title": "Economy",
      "seats": List.generate(
          6,
              (index) => {
            'seatAB': List.generate(
                2,
                    (i) => {
                  "price": (index + 1) % 4 == 0 ? 25 : 0,
                  "isOccupied": index.isEven ? true : false
                }),
            "seatCD": List.generate(
                2,
                    (i) => {
                  "price": (i + 1) % 3 == 0 ? 25 : 0,
                  "isOccupied": index.isEven ? true : false
                }),
            "seatNo": 0
          }),
    },
  ];
  List seatLabelsAB = ["A", "B"];

  // Seat array for Grid 2 (C and D columns)
  List<String> seatLabelsCD = ["C", "D"];

  //payment method list

  List paymentMethodList = [
    {
      "title": "Recommended",
      "optionList": [
        {"title": "Sofart", "image": imageAssets.sofart, "fees": "No fee"},
        {"title": "iDeal", "image": imageAssets.ideal, "fees": "No fee"},
        {
          "title": "Bancontact",
          "image": imageAssets.bancontact,
          "fees": "No fee"
        }
      ]
    },
    {
      "title": "Other payment methods",
      "optionList": [
        {
          "title": "Credit card",
          "image": imageAssets.creditCard,
          "fees": "No fee"
        },
        {"title": "PayPal", "image": imageAssets.payPal, "fees": "+3.4% fee"}
      ]
    }
  ];

  List myFlightBooking = [
    {
      "totalDays": 2,
      "airlines": imageAssets.appLogo,
      "airlineName": "Delta",
      "depart": "Los Angeles",
      "arrival": "London",
      "departAirport": 'LAX',
      "arrivalAirport": "LHR",
      "departTime": "Aug 20, 10:45AM",
      "arrivalTime": "Aug 21, 8:15AM",
      "status": "Checked in"
    },
    {
      "totalDays": 5,
      "airlines": imageAssets.appLogo,
      "airlineName": "Delta",
      "depart": "Seattle",
      "arrival": "London",
      "departAirport": 'SEA',
      "arrivalAirport": "JFK",
      "departTime": "Aug 27, 7:25AM",
      "arrivalTime": "Aug 27, 5:15PM",
      "status": "Pending"
    },
    {
      "totalDays": 8,
      "airlines": imageAssets.appLogo,
      "airlineName": "Delta",
      "depart": "Miami",
      "arrival": "Seattle",
      "departAirport": 'MIA',
      "arrivalAirport": "SEA",
      "departTime": "Sep 1, 2:15PM",
      "arrivalTime": "Sep 1, 8:55PM",
      "status": "Seat Not Selected"
    }
  ];

  List<String> flightStatus = [
    fonts.pending,
    fonts.checkedIn,
    fonts.seatNotSelected
  ];

  List howItWorks = [
    {
      "icon": svgAssets.seat,
      "title":
      "Paxpass helps you to automatically select seats based on your preference"
    },
    {
      "icon": svgAssets.thumbUp,
      "title":
      "Just provide us with your seat preference, we can help you to streamline your checkin process!"
    }
  ];

  List planeFrontMiddleTailOption = [
    {
      "selectedImage": imageAssets.frontColor,
      "image": imageAssets.front,
      "title": "Front"
    },
    {
      "selectedImage": imageAssets.middleColor,
      "image": imageAssets.middle,
      "title": "Middle"
    },
    {
      "selectedImage": imageAssets.tailColor,
      "image": imageAssets.tail,
      "title": "Tail"
    }
  ];

  List seatOption = [
    {
      "selectedImage": imageAssets.aisleColor,
      "image": imageAssets.aisle,
      "title": "Aisle"
    },
    {
      "selectedImage": imageAssets.middleChairColor,
      "image": imageAssets.middleChair,
      "title": "Middle"
    },
    {
      "selectedImage": imageAssets.windowColor,
      "image": imageAssets.window,
      "title": "Window"
    }
  ];
}
