package immortan

/// When adding new ticker you should define case class and add
/// it to the 'knownTickers' field.
trait Ticker {
  def tag: String
}

case class USD() extends Ticker {
  def tag = "USD"
}

case class EUR() extends Ticker {
  def tag = "EUR"
}

object Ticker {
  final val USD_TICKER = USD()
  final val EUR_TICKER = EUR()

  final val knownTickers: Set[Ticker] = Set(
    USD_TICKER,
    EUR_TICKER
  )

  def tickerByTag(tag: String): Option[Ticker] = {
    knownTickers.find(_.tag == tag)
  }
}
