// Use foldLeft to compute the total size of a list of strings.
val stringList = List("hello", "world")
println(stringList.foldLeft(0)((sum, string) => sum + string.size))

// Write a Censor trait with a method that will replace the curse words Shoot and Darn with Pucky and Beans alternatives. Use a map to store the curse words and their alternatives.
// Load the curse words and alternatives from a file.

trait Censor {
  val dict = new scala.collection.mutable.HashMap[String, String]
  dict += "Shoot" -> "Pucky"
  dict += "Darn" -> "Beans"
  scala.io.Source.fromFile("dict.txt").getLines.foreach { line =>
    val words = line.split(" ")
    dict += words(0) -> words(1)
  }

  def censor(words : String) = {
    (words /: dict) { (string, rule) => string.replaceAll(rule._1, rule._2) }
  }
}

class Inspector extends Censor

val inspector = new Inspector
println(inspector.censor("Hello Shoot Darn"))
