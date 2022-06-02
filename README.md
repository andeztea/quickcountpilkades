# quickcountpilkades
Quick Count RealTime Vue Js send data with WhatsApp Bot

This app is realtime quick count app with vue js, whatsapp-web.js and node js.


Instalasion 
- Install Node JS version >=12
- Install vue Js   	

```
npm install --global vue-cli
```

-Clone Repositories quickcountpilkades

```
cd quickcountpilkades
npm install
npm run serve
```

-Clone Repositories [wabotquickcount](https://github.com/andeztea/WaBootQuickCountPilkades.git)

```
cd wabotquickcount
npm install
node server.js
```
in command after start node js please scan barcode qr in whatsapp 
when finish scan barcode message will in command Client is Ready 

After running please import database sql in repositories (db_api_wa_gateway.sql)

Send Wa to Number used Scan Qrcode in wa bot with other number 
Template Text Send Wa

```
Insert Data to TPS
example: !insertDataTps 01 02 200 ; 
!insertDataTp=Code For Detect Text in wa bot
01 = Number TPS 
02 = Number Calon 
200 = number of ballots

Update count dtp in tps 
example : !updateTps 01 200 20
!updateTps = Code For Detect Text in wa bot
01 = Number TPS
200 = number of ballots
20=number of damaged ballots

```
-Clone Repositories Api Service With Node Js  [Api Service](https://github.com/andeztea/apiquickcountpilkades.git)

```
cd apiwagateway
npm install
node server.js
```


Finish
