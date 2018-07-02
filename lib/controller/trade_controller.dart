import '../my_project.dart';
import 'package:my_project/model/trade.dart';

class TradeController extends HTTPController {

    @httpGet
    Future<Response> getTrades() async {

      var tradeQuery = new Query<Trade>()
      ..join(object: (trade) => trade.user);

      var databaseTrade = await tradeQuery.fetch();

      return new Response.ok(databaseTrade);

    }

    @httpGet
    Future<Response> getTradesByItemName(@HTTPPath("itemName")String itemName) async {

      var tradeQuery = new Query<Trade>()
      ..join(object: (trade) => trade.user)
      ..where.itemName = whereContainsString(itemName);

      var databaseTrade = await tradeQuery.fetch();

      if (databaseTrade == null) {
        return new Response.notFound();
      }
      return new Response.ok(databaseTrade);
    }

    @httpPost
    Future<Response> addTrade(@HTTPBody() Trade trade) async {
      var query = new Query<Trade>()..values = trade;
      return new Response.ok(await query.insert());
    }

    @httpDelete
    Future<Response> deleteTrade(@HTTPPath("index") int index) async {
      var query = new Query<Trade>()..where.index = whereEqualTo(index);
      var deletedTradeId = await query.delete();

      if (deletedTradeId == 0) {
        return new Response.notFound(body: 'Esta troca não existe');
      }
      return new Response.ok('Troca deletada com sucesso.');
    }

}