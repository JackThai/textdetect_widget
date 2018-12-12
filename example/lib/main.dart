import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:textdetect_widget/textdetect_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, String> companies;
  TextdetectController textdetectController;
  String tickerString;

  @override
  void initState() {
    super.initState();
    companies = <String, String>{
      'Tourism Holdings Limited' : 'THL.NZ',
      'Port of Tauranga Limited' : 'POT.NZ',
      'Metlifecare Limited' : 'MET.NZ',
      'Genesis Energy Limited' : 'GNE.NZ',
      'Mayfield Childcare Limited' : 'MFD.AX',
      'Embelton Limited' : 'EMB.AX',
      'Gentrack Group Limited' : 'GTK.NZ',
      'Nufarm Limited' : 'NUF.AX',
      'Aveo Group Limited' : 'AOG.AX',
      'Mainfreight Limited' : 'MFT.NZ',
      'South Port New Zealand Limited' : 'SPN.NZ',
      'Bellamys Australia Limited' : 'BAL.AX',
      'NEXTDC Limited' : 'NXT.AX',
      'Foley Wines Limited' : 'FWL.NZ',
      'Reckon Limited' : 'RKN.AX',
      'Surfstitch Group Limited' : 'SRF.AX',
      'Trade Me Group Limited' : 'TME.NZ',
      'Lycopodium Limited' : 'LYL.AX',
      'Wellington Merchants Limited' : 'KRK.NZ',
      'McPhersons Limited' : 'MCP.AX',
      'Flight Centre Travel Group Limited' : 'FLT.AX',
      'Pro-Pac Packaging Limited' : 'PPG.AX',
      'Experience Co Limited' : 'EXP.AX',
      'Promisia Integrative Limited' : 'PIL.NZ',
      'Helloworld Travel Limited' : 'HLO.AX',
      'Mantra Group Limited' : 'MTR.AX',
      'Evolution Mining Limited' : 'EVN.AX',
      'Chorus Limited' : 'CNU.NZ',
      'Patties Foods Limited' : 'PFL.AX',
      'OZ Minerals Limited' : 'OZL.AX',
      'Mercury NZ Limited' : 'MCY.NZ',
      'Adairs Limited' : 'ADH.AX',
      'Ridley Corporation Limited' : 'RIC.AX',
      'Meridian Energy Limited' : 'MEL.NZ',
      'T&G Global Limited' : 'TGG.NZ',
      'Marsden Maritime Holdings Limited' : 'MMH.NZ',
      'Restaurant Brands New Zealand Limited' : 'RBD.NZ',
      'ResMed Incorporated' : 'RMD.AX',
      'Tassal Group Limited' : 'TGR.AX',
      'Amcor Limited' : 'AMC.AX',
      'Accent Group Limited' : 'AX1.AX',
      'Indoor Skydive Australia Group Limited' : 'IDZ.AX',
      'Oliverâ€™s Real Food Limited' : 'OLI.AX',
      'New Zealand Oil and Gas Limited' : 'NZO.NZ',
      'NZ Windfarms Limited' : 'NWF.NZ',
      'Investa Office Fund' : 'IOF.AX',
      'Shriro Holdings Limited' : 'SHM.AX',
      'Tenon Limited' : 'TEN.NZ',
      'Qantas Airways Limited' : 'QAN.AX',
      'Rhinomed Limited' : 'RNO.AX',
      'Murray Cod Australia Limited' : 'MCA.AX',
      'Gage Roads Brewing Co Limited' : 'GRB.AX',
      'Augusta Capital Limited' : 'AUG.NZ',
      'Noni B Limited' : 'NBL.AX',
      'Burger Fuel Worldwide Limited' : 'BFW.NZ',
      'Fletcher Building Limited' : 'FBU.NZ',
      'Orica Limited' : 'ORI.AX',
      'Stride Property & Stride Investment Management Limited' : 'SPG.NZ',
      'TTA Holdings Limited' : 'TTA.AX',
      'San Miguel Brewery Hong Kong Limited' : '0236.HK',
      'APN Outdoor Group Limited' : 'APO.AX',
      'Metcash Limited' : 'MTS.AX',
      'BLIS Technologies Limited' : 'BLT.NZ',
      'Baby Bunting Group Limited' : 'BBN.AX',
      'G8 Education Limited' : 'GEM.AX',
      'Scott Technology Limited' : 'SCT.NZ',
      'McGrath Limited' : 'MEA.AX',
      'Globe International Limited' : 'GLB.AX',
      'Vicinity Limited' : 'VCX.AX',
      'Stella International Holdings Limited' : '1836.HK',
      'Skellerup Holdings Limited' : 'SKL.NZ',
      'Invocare Limited' : 'IVC.AX',
      'Tsingtao Brewery Company Limited' : '0168.HK',
      'Monadelphous Group Limited' : 'MND.AX',
      'MGM China Holdings Limited' : '2282.HK',
      'Shenzhou International Group Holdings Limited' : '2313.HK',
      'Pacific Smiles Group Limited' : 'PSQ.AX',
      'Mercer Group Limited' : 'MGL.NZ',
      'China Southern Airlines Company Limited' : '1055.HK',
      'Xinyi Glass Holdings Limited' : '0868.HK',
      'Rakon Limited' : 'RAK.NZ',
      'Propel Funeral Partners Limited' : 'PFP.AX',
      'Northern Star Resources Limited' : 'NST.AX',
      'Dominoâ€™s Pizza Enterprises Limited' : 'DMP.AX',
      'Senetas Corporation Limited' : 'SEN.AX',
      'Alcidion Group Limited' : 'ALC.AX',
      'Ansell Limited' : 'ANN.AX',
      'Harvey Norman Holdings Limited' : 'HVN.AX',
      'Clover Corporation Limited' : 'CLV.AX',
      'Sunbridge Group Limited' : 'SBB.AX',
      'Funtastic Limited' : 'FUN.AX',
      'Corporate Travel Management Limited' : 'CTD.AX',
      'The Warehouse Group Limited' : 'WHS.NZ',
      'Hellaby Holdings Limited' : 'HBY.NZ',
      'Turners and Growers Limited' : 'TUR.NZ',
      'JB Hi-Fi Limited' : 'JBH.AX',
      'Sirtex Medical Limited' : 'SRX.AX',
      'Win Hanverky Holdings Limited' : '3322.HK',
      'Autosports Group Limited' : 'ASG.AX',
      'Metro Performance Glass Limited' : 'MPG.NZ',
      'Greencross Limited' : 'GXL.AX',
      'Adelaide Brighton Limited' : 'ABC.AX',
      'SKYCITY Entertainment Group Limited' : 'SKC.NZ',
      'Australian Agricultural Projects Limited' : 'AAP.AX',
      'Serko Limited' : 'SKO.NZ',
      'Steel & Tube Holdings Limited' : 'STU.NZ',
      'carsales.com Limited' : 'CAR.AX',
      'CTI Logistics Limited' : 'CLX.AX',
      'Carindale Property Trust' : 'CDP.AX',
      'Just Water International Limited' : 'JWI.NZ',
      'Contact Energy Limited' : 'CEN.NZ',
      'Pumpkin Patch Limited' : 'PPL.NZ',
      'Argosy Property Limited' : 'ARG.NZ',
      'Fuyao Glass Industry Group Company Limited' : '3606.HK',
      'Apollo Tourism & Leisure Limited' : 'ATL.AX',
      'Regis Resources Limited' : 'RRL.AX',
      'Retail Food Group Limited' : 'RFG.AX',
      'Telstra Corporation Limited' : 'TLS.AX',
      'Computershare Limited' : 'CPU.AX',
      'PGG Wrightson Limited' : 'PGW.NZ',
      'Future Mobility Solutions Limited' : 'FMS.NZ',
      'Kathmandu Holdings Limited' : 'KMD.NZ',
      'Range International Limited' : 'RAN.AX',
      'Lindsay Australia Limited' : 'LAU.AX',
      'China Glass Holdings Limited' : '3300.HK',
      'FFI Holdings Limited' : 'FFI.AX',
      'Woolworths Group Limited' : 'WOW.AX',
      'Coles Group Limited' : 'COL.AX',
      'Finzsoft Solutions Limited' : 'FIN.NZ',
      'Bega Cheese Limited' : 'BGA.AX',
      'AP Eagers Limited' : 'APE.AX',
      'Lifestyle Communities Limited' : 'LIC.AX',
      'Precinct Properties New Zealand Limited' : 'PCT.NZ',
      'Inghams Group Limited' : 'ING.AX',
      'Tilt Renewables Limited' : 'TLT.NZ',
      'Westgold Resources Limited' : 'WGX.AX',
      'Apiam Animal Health Limited' : 'AHX.AX',
      'Arvida Group Limited' : 'ARV.NZ',
      'Broo Limited' : 'BEE.AX',
      'Xero Limited' : 'XRO.AX',
      'Seadragon Limited' : 'SEA.NZ',
      'Beacon Lighting Group Limited' : 'BLX.AX',
      'Orora Limited' : 'ORA.AX',
      'Scales Corporation Limited' : 'SCL.NZ',
      'Bethunes Investments Limited' : 'BIL.NZ',
      'ETAP' : 'TAP.NZ',
      'Aristocrat Leisure Limited' : 'ALL.AX',
      'Shaver Shop Group Limited' : 'SSG.AX',
      'Resolute Mining Limited' : 'RSG.AX',
      'WiseTech Global Limited' : 'WTC.AX',
      'QMS Media Limited' : 'QMS.AX',
      'Clean Seas Seafood Limited' : 'CSS.AX',
      'AFT Pharmaceuticals Limited' : 'AFT.NZ',
      'Cathay Pacific Airways Limited' : '0293.HK',
      'Allied Farmers Limited' : 'ALF.NZ',
      'Abano Healthcare Group Limited' : 'ABA.NZ',
      'Ainsworth Game Technology Limited' : 'AGI.AX',
      'Hallenstein Glasson Holdings Limited' : 'HLG.NZ',
      'Wesfarmers Limited' : 'WES.AX',
      'Select Harvests Limited' : 'SHV.AX',
      'Evolve Education Group Limited' : 'EVO.NZ',
      'National Veterinary Care Limited' : 'NVL.AX',
      'The Colonial Motor Company Limited' : 'CMO.NZ',
      'Blackmores Limited' : 'BKL.AX',
      'St Barbara Limited' : 'SBM.AX',
      'Data#3 Limited' : 'DTL.AX',
      'Breville Group Limited' : 'BRG.AX',
      'Myer Holdings Limited' : 'MYR.AX',
      'Asaleo Care Limited' : 'AHY.AX',
      'Think Childcare Limited' : 'TNK.AX',
      'Godfreys Group Limited' : 'GFY.AX',
      'K&S Corporation Limited' : 'KSC.AX',
      'Warrnambool Cheese and Butter Factory Company Holdings Limited' : 'WCB.AX',
      'Reliance Worldwide Corporation Limited' : 'RWC.AX',
      'Vita Life Sciences Limited' : 'VLS.AX',
      'National Tyre & Wheel Limited' : 'NTD.AX',
      'Ryman Healthcare Limited' : 'RYM.NZ',
      'Crown Resorts Limited' : 'CWN.AX',
      'Asset Plus Limited' : 'APL.NZ',
      'Sydney Airport Limited' : 'SYD.AX',
      'The Reject Shop Limited' : 'TRS.AX',
      'Regional Express Holdings Limited' : 'REX.AX',
      'Property for Industry Limited' : 'PFI.NZ',
      'Bathurst Resources Limited' : 'BRL.AX',
      'Cavalier Corporation Limited' : 'CAV.NZ',
      'XPD Soccer Gear Group Limited' : 'XPD.AX',
      'Auckland International Airport Limited' : 'AIA.NZ',
      'The New Zealand Refining Company Limited' : 'NZR.NZ',
      'Bapcor Limited' : 'BAP.AX',
      'Delegat Group Limited' : 'DGL.NZ',
      'Plexure Group Limited' : 'PLX.NZ',
      'HotCopper Holdings Limited' : 'HOT.AX',
      'TPG Telecom Limited' : 'TPM.AX',
      'Capilano Honey Limited' : 'CZZ.AX',
      'Michael Hill International Limited' : 'MHJ.AX',
      'Japara Healthcare Limited' : 'JHC.AX',
      'Air China Limited' : '0753.HK',
      'Ruralco Holdings Limited' : 'RHL.AX',
      'Freightways Limited' : 'FRE.NZ',
      'Temple & Webster Group Limited' : 'TPW.AX',
      'Kip McGrath Education Centres Limited' : 'KME.AX',
      'Pushpay Holdings Limited' : 'PPH.NZ',
      'Trilogy International Limited' : 'TIL.NZ',
      'Programmed Maintenance Services Limited' : 'PRG.AX',
      'Namoi Cotton Co-operative Limited' : 'NAM.AX',
      'Synlait Milk Limited' : 'SML.NZ',
      'Collins Foods Limited' : 'CKF.AX',
      'Vital Healthcare Property Trust' : 'VHP.NZ',
      'HGL Limited' : 'HNG.AX',
      'Comvita Limited' : 'CVT.NZ',
      'Freedom Foods Group Limited' : 'FNP.AX',
      'AWF Madison Group Limited' : 'AWF.NZ',
      'Farm Pride Foods Limited' : 'FRM.AX',
      'SeaLink Travel Group Limited' : 'SLK.AX',
      'DuluxGroup Limited' : 'DLX.AX',
      'Pacific Edge Limited' : 'PEB.NZ',
      'Australian Pharmaceutical Industries Limited' : 'API.AX',
      'Gale Pacific Limited' : 'GAP.AX',
      'Technology One Limited' : 'TNE.AX',
      'Sanford Limited' : 'SAN.NZ',
      'Energy Mad Limited' : 'MAD.NZ',
      'Supply Network Limited' : 'SNL.AX',
      'Brisbane Broncos Limited' : 'BBL.AX',
      'Australian Agriculture Company Limited' : 'AAC.AX',
      'ARB Corporation Limited' : 'ARB.AX',
      'iBosses Corporation Limited' : 'IB8.AX',
      'EROAD Limited' : 'ERD.NZ',
      'Costa Group Holdings Limited' : 'CGC.AX',
      'SEEK Limited'  : 'SEK.AX',
      'Smiths City Group Limited' : 'SCY.NZ',
      'Lovisa Holdings Limited' : 'LOV.AX',
      'Vitaco Holdings Limited' : 'VIT.AX',
      'NZX Limited' : 'NZX.NZ',
      'Regina Miracle International (Holdings) Limited' : '2199.HK',
      'The A2 Milk Company Limited' : 'ATM.NZ',
      'Buderim Group Limited' : 'BUG.AX',
      'The Star Entertainment Group Limited' : 'SGR.AX',
      '1300 Smiles Limited' : 'ONT.AX',
      'Western Areas Limited' : 'WSA.AX',
      'Estia Health Limited' : 'EHE.AX',
      'New Zealand King Salmon Investments Limited' : 'NZK.NZ',
      'Aurizon Holdings Limited' : 'AZJ.AX',
      'Nick Scali Limited' : 'NCK.AX',
      'Webjet Limited' : 'WEB.AX',
      'Dexus Property Group' : 'DXS.AX',
      'Seeka Limited' : 'SEK.NZ',
      'Kiwi Property Group Limited' : 'KPG.NZ',
      'AMA Group Limited' : 'AMA.AX',
      'Holista Colltech Limited' : 'HCT.AX',
      'Nuplex Industries Limited' : 'NPX.NZ',
      'Hong Kong Exchanges & Clearing Limited' : '0388.HK',
      'Veritas Investments Limited' : 'VIL.NZ',
      'Abacus Group Holdings Limited' : 'ABP.AX',
      'Pental Limited' : 'PTL.AX',
      'Creso Pharma Limited' : 'CPH.AX',
      'Huon Aquaculture Group Limited' : 'HUO.AX',
      'Methven Limited' : 'MVN.NZ',
      'Royal Wolf Holdings Limited' : 'RWH.AX',
      'TIL Logistics Group Limited' : 'TLL.NZ',
      'Wellington Drive Technologies Limited' : 'WDT.NZ',
      'ASX Limited' : 'ASX.AX',
      'MYOB Group Limited' : 'MYO.AX',
      'Kogan.com Limited' : 'KGN.AX',
      'OceanaGold Corporation' : 'OGC.AX',
      'Green Cross Health Limited' : 'GXH.NZ',
      'Best Pacific International Holdings Limited' : '2111.HK',
      'Goodman Property Trust' : 'GMT.NZ',
      'Michael Hill International Limited New Zealand' : 'MHI.NZ',
      'Pan Pacific Petroleum NL' : 'PPP.AX',
      'GWA Group Limited' : 'GWA.AX',
      'Airwork Holdings Limited' : 'AWK.NZ',
      'Pact Group Holdings Limited' : 'PGH.AX',
      'Saracen Mineral Holdings Limited' : 'SAR.AX',
      'Sandfire Resources NL' : 'SFR.AX',
      'Sigma Healthcare Limited' : 'SIG.AX',
      'oOh!media Limited' : 'OML.AX',
      'Seafarms Group Limited' : 'SFG.AX',
      'Vitasoy International Holdings Limited' : '0345.HK',
      'Tegel Group Holdings Limited' : 'TGH.NZ',
      'Elders Limited' : 'ELD.AX',
      'Ebos Group Limited' : 'EBO.NZ',
      'Schaffer Corporation Limited' : 'SFC.AX',
      'Summerset Group Holdings Limited' : 'SUM.NZ',
      'Cromwell Property Group' : 'CMW.AX',
      'REA Group Limited' : 'REA.AX',
      'BWX Limited' : 'BWX.AX',
      'OrotonGroup Limited' : 'ORL.AX',
      'Fisher & Paykel Healthcare Corporation Limited' : 'FPH.NZ',
      'Appen Limited' : 'APX.AX',
      'Investore Property Limited' : 'IPL.NZ',
      'Air New Zealand Limited' : 'AIR.NZ',
      'Moa Group Limited' : 'MOA.NZ',
      'Sitoy Group Holdings Limited' : '1023.HK',
      'Catapult Group International Limited' : 'CAT.AX',
      'Fliway Group Limited' : 'FLI.NZ',
      'Briscoe Group Limited' : 'BGP.NZ',
      'Automotive Holdings Group Limited' : 'AHG.AX',
      'Smiles Inclusive Limited' : 'SIL.AX',
      'Australian Vintage Limited' : 'AVG.AX',
      'Oceania Healthcare Limited' : 'OCA.NZ',
    };
//    for (int i=0;i<500;i++) {
//      companies["companyname_$i"] = "comapny_`$i";
//    }
  }

  Future<dynamic> _handelTextDetect(MethodCall call) async {
    switch(call.method) {
      case "detect":
        debugPrint(call.arguments);
        setState(() {
          tickerString = call.arguments;
        });
        break;
      case "moveout":
        debugPrint(call.arguments);
        setState(() {
          tickerString = "Move out";
        });
        break;
      default:
        break;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Stack(
              alignment: FractionalOffset.center,
              children: <Widget>[
                TextdetectWidget(
                  onTextDetectWidgetCreated: _onTextDetectCreated,
                  companies: companies,
                ),
                Text(
                  tickerString != null ? tickerString : '',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 60.0
                  ),
                )
              ],
            )
        )
    );

  }

  void _onTextDetectCreated(TextdetectController controller) {
    textdetectController = controller;
    controller.setHandler(_handelTextDetect);
  }
}
