package immortan.utils

class Rational(n: Long, d: Long) extends Ordered[Rational] {
  require( d != 0 )

  private val g = Rational.gcd(n.abs, d.abs)
  val numer: Long = n/g * d.signum
  val denom: Long = d.abs/g

  def this(n: Long) = this(n, 1)

  override def toString = numer + (if (denom == 1) "" else ("/"+denom))
  def toLong = math round (numer.toDouble / denom.toDouble)

  // default methods
  def +(that: Rational): Rational = new Rational( numer * that.denom + that.numer * denom, denom * that.denom )
  def -(that: Rational): Rational = this + (-that)
  def unary_- = new Rational( -numer, denom )
  def abs = new Rational( numer.abs, denom )
  def signum = new Rational( numer.signum )

  def *(that: Rational): Rational = new Rational( this.numer * that.numer, this.denom * that.denom )
  def /(that: Rational): Rational = this * that.inverse
  def inverse = new Rational( denom, numer )

  def compare(that: Rational) = (this.numer * that.denom - that.numer * this.denom).toInt
  def equals(that: Rational) = this.numer == that.numer && this.denom == that.denom

}

object Rational {
  implicit def longToRational(x: Long) = new Rational(x)
  private def gcd(a: Long, b: Long) : Long = if (b == 0) a else gcd(b, a % b)

  def apply(numer: Long, denom: Long) = new Rational(numer, denom)
  def apply(numer: Long) = new Rational(numer)
}