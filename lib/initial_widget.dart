import 'package:conversor_moedas/presentation/components/global_app_bar.dart';
import 'package:conversor_moedas/presentation/components/global_bottom_navigation_bar.dart';
import 'package:conversor_moedas/presentation/pages/conversor.dart';
import 'package:conversor_moedas/presentation/pages/list_coins.dart';
import 'package:conversor_moedas/presentation/providers/main_contoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialWidget extends StatefulWidget {
  @override
  _InitialWidgetState createState() => _InitialWidgetState();
}

class _InitialWidgetState extends State<InitialWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar().build(context),
      bottomNavigationBar: GlobalBottomNavigationBar(),
      body: Consumer<MainController>(
        builder: (_, main, child) {
          return <Widget>[
            Conversor(),
            ListCoins(),
          ].elementAt(main.selectedIndex);
        },
      ),
    );
  }
}

class AddLoading extends StatelessWidget {
  final bool loading;
  final Widget child;

  const AddLoading({
    this.loading = false,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading)
          Container(
            color: Colors.grey.withOpacity(.3),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}

String fakeReqLive =
    '{ "success": true,    "terms": "https://currencylayer.com/terms",    "privacy": "https://currencylayer.com/privacy",    "timestamp": 1610088726,    "source": "USD",    "quotes": {      "USDAED": 3.67296,      "USDAFN": 77.205072,      "USDALL": 100.970763,      "USDAMD": 522.590103,      "USDANG": 1.796323,      "USDAOA": 649.940233,      "USDARS": 84.939404,      "USDAUD": 1.285802,      "USDAWG": 1.8,      "USDAZN": 1.702449,      "USDBAM": 1.596831,      "USDBBD": 2.020558,      "USDBDT": 84.854917,      "USDBGN": 1.594402,      "USDBHD": 0.376969,      "USDBIF": 1942.014549,      "USDBMD": 1,      "USDBND": 1.326105,      "USDBOB": 6.889829,      "USDBRL": 5.410505,      "USDBSD": 1.000727,      "USDBTC": 0.000025933479,      "USDBTN": 73.152545,      "USDBWP": 11.02131,      "USDBYN": 2.576645,      "USDBYR": 19600,      "USDBZD": 2.017129,      "USDCAD": 1.268102,      "USDCDF": 1971.000166,      "USDCHF": 0.88558,      "USDCLF": 0.025833,      "USDCLP": 712.801635,      "USDCNY": 6.46597,      "USDCOP": 3489.99,      "USDCRC": 611.990627,      "USDCUC": 1,      "USDCUP": 26.5,      "USDCVE": 90.025473,      "USDCZK": 21.372399,      "USDDJF": 178.15008,      "USDDKK": 6.06545,      "USDDOP": 58.192833,      "USDDZD": 132.214002,      "USDEGP": 15.7021,      "USDERN": 15.000079,      "USDETB": 39.429861,      "USDEUR": 0.815355,      "USDFJD": 2.01415,      "USDFKP": 0.73673,      "USDGBP": 0.73685,      "USDGEL": 3.309925,      "USDGGP": 0.73673,      "USDGHS": 5.864127,      "USDGIP": 0.73673,      "USDGMD": 51.709917,      "USDGNF": 10271.06909,      "USDGTQ": 7.798044,      "USDGYD": 209.426691,      "USDHKD": 7.75265,      "USDHNL": 24.130667,      "USDHRK": 6.167599,      "USDHTG": 73.387275,      "USDHUF": 293.010247,      "USDIDR": 14046.5,      "USDILS": 3.18087,      "USDIMP": 0.73673,      "USDINR": 73.32435,      "USDIQD": 1461.031009,      "USDIRR": 42105.000307,      "USDISK": 126.630445,      "USDJEP": 0.73673,      "USDJMD": 142.92526,      "USDJOD": 0.708974,      "USDJPY": 103.898034,      "USDKES": 109.549722,      "USDKGS": 83.077297,      "USDKHR": 4055.927498,      "USDKMF": 401.649943,      "USDKPW": 900.057492,      "USDKRW": 1090.170093,      "USDKWD": 0.30351,      "USDKYD": 0.833918,      "USDKZT": 419.482046,      "USDLAK": 9297.529433,      "USDLBP": 1513.29594,      "USDLKR": 188.131251,      "USDLRD": 166.874964,      "USDLSL": 15.049936,      "USDLTL": 2.95274,      "USDLVL": 0.60489,      "USDLYD": 4.442648,      "USDMAD": 8.817975,      "USDMDL": 17.184298,      "USDMGA": 3768.368455,      "USDMKD": 50.305351,      "USDMMK": 1328.448657,      "USDMNT": 2850.379698,      "USDMOP": 7.99097,      "USDMRO": 356.999828,      "USDMUR": 39.498624,      "USDMVR": 15.402199,      "USDMWK": 774.135974,      "USDMXN": 19.921034,      "USDMYR": 4.040503,      "USDMZN": 74.924973,      "USDNAD": 15.050294,      "USDNGN": 381.202622,      "USDNIO": 34.875366,      "USDNOK": 8.42243,      "USDNPR": 117.047004,      "USDNZD": 1.37659,      "USDOMR": 0.385008,      "USDPAB": 1.000718,      "USDPEN": 3.627635,      "USDPGK": 3.558814,      "USDPHP": 48.060092,      "USDPKR": 160.664675,      "USDPLN": 3.683104,      "USDPYG": 6847.837624,      "USDQAR": 3.64125,      "USDRON": 3.969196,      "USDRSD": 95.870191,      "USDRUB": 74.238504,      "USDRWF": 991.827237,      "USDSAR": 3.751952,      "USDSBD": 8.066615,      "USDSCR": 21.20534,      "USDSDG": 55.302097,      "USDSEK": 8.18612,      "USDSGD": 1.32542,      "USDSHP": 0.73673,      "USDSLL": 10116.000257,      "USDSOS": 584.999733,      "USDSRD": 14.154016,      "USDSTD": 20834.863349,      "USDSVC": 8.756389,      "USDSYP": 512.833995,      "USDSZL": 15.297028,      "USDTHB": 30.060266,      "USDTJS": 11.335462,      "USDTMT": 3.51,      "USDTND": 2.691501,      "USDTOP": 2.26425,      "USDTRY": 7.327503,      "USDTTD": 6.799366,      "USDTWD": 27.992802,      "USDTZS": 2319.55498,      "USDUAH": 28.292769,      "USDUGX": 3697.604546,      "USDUSD": 1,      "USDUYU": 42.375206,      "USDUZS": 10467.391127,      "USDVEF": 9.987502,      "USDVND": 23067.5,      "USDVUV": 107.903305,      "USDWST": 2.496172,      "USDXAF": 535.562541,      "USDXAG": 0.037056,      "USDXAU": 0.000524,      "USDXCD": 2.70255,      "USDXDR": 0.689827,      "USDXOF": 535.558168,      "USDXPF": 97.675016,      "USDYER": 250.35016,      "USDZAR": 15.367805,      "USDZMK": 9001.196076,      "USDZMW": 21.205167,      "USDZWL": 322.000186    }  }';

String fakeReqList =
    '{    "success": true,    "terms": "https://currencylayer.com/terms",    "privacy": "https://currencylayer.com/privacy",    "currencies": {        "AED": "United Arab Emirates Dirham",        "AFN": "Afghan Afghani",        "ALL": "Albanian Lek",        "AMD": "Armenian Dram",        "ANG": "Netherlands Antillean Guilder",        "AOA": "Angolan Kwanza",        "ARS": "Argentine Peso",        "AUD": "Australian Dollar",        "AWG": "Aruban Florin",        "AZN": "Azerbaijani Manat",        "BAM": "Bosnia-Herzegovina Convertible Mark",        "BBD": "Barbadian Dollar",        "BDT": "Bangladeshi Taka",        "BGN": "Bulgarian Lev",        "BHD": "Bahraini Dinar",        "BIF": "Burundian Franc",        "BMD": "Bermudan Dollar",        "BND": "Brunei Dollar",        "BOB": "Bolivian Boliviano",        "BRL": "Brazilian Real",        "BSD": "Bahamian Dollar",        "BTC": "Bitcoin",        "BTN": "Bhutanese Ngultrum",        "BWP": "Botswanan Pula",        "BYN": "New Belarusian Ruble",        "BYR": "Belarusian Ruble",        "BZD": "Belize Dollar",        "CAD": "Canadian Dollar",        "CDF": "Congolese Franc",        "CHF": "Swiss Franc",        "CLF": "Chilean Unit of Account (UF)",        "CLP": "Chilean Peso",        "CNY": "Chinese Yuan",        "COP": "Colombian Peso",        "CRC": "Costa Rican Colón",        "CUC": "Cuban Convertible Peso",        "CUP": "Cuban Peso",        "CVE": "Cape Verdean Escudo",        "CZK": "Czech Republic Koruna",        "DJF": "Djiboutian Franc",        "DKK": "Danish Krone",        "DOP": "Dominican Peso",        "DZD": "Algerian Dinar",        "EGP": "Egyptian Pound",        "ERN": "Eritrean Nakfa",        "ETB": "Ethiopian Birr",        "EUR": "Euro",        "FJD": "Fijian Dollar",        "FKP": "Falkland Islands Pound",        "GBP": "British Pound Sterling",        "GEL": "Georgian Lari",        "GGP": "Guernsey Pound",        "GHS": "Ghanaian Cedi",        "GIP": "Gibraltar Pound",        "GMD": "Gambian Dalasi",        "GNF": "Guinean Franc",        "GTQ": "Guatemalan Quetzal",        "GYD": "Guyanaese Dollar",        "HKD": "Hong Kong Dollar",        "HNL": "Honduran Lempira",        "HRK": "Croatian Kuna",        "HTG": "Haitian Gourde",        "HUF": "Hungarian Forint",        "IDR": "Indonesian Rupiah",        "ILS": "Israeli New Sheqel",        "IMP": "Manx pound",        "INR": "Indian Rupee",        "IQD": "Iraqi Dinar",        "IRR": "Iranian Rial",        "ISK": "Icelandic Króna",        "JEP": "Jersey Pound",        "JMD": "Jamaican Dollar",        "JOD": "Jordanian Dinar",        "JPY": "Japanese Yen",        "KES": "Kenyan Shilling",        "KGS": "Kyrgystani Som",        "KHR": "Cambodian Riel",        "KMF": "Comorian Franc",        "KPW": "North Korean Won",        "KRW": "South Korean Won",        "KWD": "Kuwaiti Dinar",        "KYD": "Cayman Islands Dollar",        "KZT": "Kazakhstani Tenge",        "LAK": "Laotian Kip",        "LBP": "Lebanese Pound",        "LKR": "Sri Lankan Rupee",        "LRD": "Liberian Dollar",        "LSL": "Lesotho Loti",        "LTL": "Lithuanian Litas",        "LVL": "Latvian Lats",        "LYD": "Libyan Dinar",        "MAD": "Moroccan Dirham",        "MDL": "Moldovan Leu",        "MGA": "Malagasy Ariary",        "MKD": "Macedonian Denar",        "MMK": "Myanma Kyat",        "MNT": "Mongolian Tugrik",        "MOP": "Macanese Pataca",        "MRO": "Mauritanian Ouguiya",        "MUR": "Mauritian Rupee",        "MVR": "Maldivian Rufiyaa",        "MWK": "Malawian Kwacha",        "MXN": "Mexican Peso",        "MYR": "Malaysian Ringgit",        "MZN": "Mozambican Metical",        "NAD": "Namibian Dollar",        "NGN": "Nigerian Naira",        "NIO": "Nicaraguan Córdoba",        "NOK": "Norwegian Krone",        "NPR": "Nepalese Rupee",        "NZD": "New Zealand Dollar",        "OMR": "Omani Rial",        "PAB": "Panamanian Balboa",        "PEN": "Peruvian Nuevo Sol",        "PGK": "Papua New Guinean Kina",        "PHP": "Philippine Peso",        "PKR": "Pakistani Rupee",        "PLN": "Polish Zloty",        "PYG": "Paraguayan Guarani",        "QAR": "Qatari Rial",        "RON": "Romanian Leu",        "RSD": "Serbian Dinar",        "RUB": "Russian Ruble",        "RWF": "Rwandan Franc",        "SAR": "Saudi Riyal",        "SBD": "Solomon Islands Dollar",        "SCR": "Seychellois Rupee",        "SDG": "Sudanese Pound",        "SEK": "Swedish Krona",        "SGD": "Singapore Dollar",        "SHP": "Saint Helena Pound",        "SLL": "Sierra Leonean Leone",        "SOS": "Somali Shilling",        "SRD": "Surinamese Dollar",        "STD": "São Tomé and Príncipe Dobra",        "SVC": "Salvadoran Colón",        "SYP": "Syrian Pound",        "SZL": "Swazi Lilangeni",        "THB": "Thai Baht",        "TJS": "Tajikistani Somoni",        "TMT": "Turkmenistani Manat",        "TND": "Tunisian Dinar",        "TOP": "Tongan Paʻanga",        "TRY": "Turkish Lira",        "TTD": "Trinidad and Tobago Dollar",        "TWD": "New Taiwan Dollar",        "TZS": "Tanzanian Shilling",        "UAH": "Ukrainian Hryvnia",        "UGX": "Ugandan Shilling",        "USD": "United States Dollar",        "UYU": "Uruguayan Peso",        "UZS": "Uzbekistan Som",        "VEF": "Venezuelan Bolívar Fuerte",        "VND": "Vietnamese Dong",        "VUV": "Vanuatu Vatu",        "WST": "Samoan Tala",        "XAF": "CFA Franc BEAC",        "XAG": "Silver (troy ounce)",        "XAU": "Gold (troy ounce)",        "XCD": "East Caribbean Dollar",        "XDR": "Special Drawing Rights",        "XOF": "CFA Franc BCEAO",        "XPF": "CFP Franc",        "YER": "Yemeni Rial",        "ZAR": "South African Rand",        "ZMK": "Zambian Kwacha (pre-2013)",        "ZMW": "Zambian Kwacha",        "ZWL": "Zimbabwean Dollar"    }}    ';
