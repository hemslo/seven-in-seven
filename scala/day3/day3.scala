// Take the sizer application and add a message to count the number of links on the page.
// Bonus problem: Make the sizer follow the links on a given page, and load them as well. For example, a sizer for “google.com” would compute the size for Google and all of the pages it links to.

import scala.io._
import scala.actors._
import Actor._

val reg = """<a href="(http.+?)".*>.*</a>""".r
// START:loader
object PageLoader {
  def load(url: String) = {
    try {
      Source.fromURL(url).mkString
    } catch {
      case e: Exception => System.err.println(e)
      ""
    }
  }
  def getPageSize(url : String) = load(url).length
  def getPageSizeAndLinks(url : String) = {
    val page = load(url)
    (page.length, reg.findAllIn(page).matchData.toList.map(_.group(1)))
  }
}
// END:loader

// val urls = List("http://www.amazon.com/",
//                "http://www.twitter.com/",
//                "http://www.google.com/",
//                "http://www.cnn.com/" )
val urls = List("http://www.zhihu.com/",
                "http://segmentfault.com/",
                "http://www.jianshu.com/")

// START:time
def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start)/1000000000.0 + " seconds.")
}
// END:time

// START:sequential
def getPageSizeSequentially() = {
  for(url <- urls) {
    val (size, links) = PageLoader.getPageSizeAndLinks(url)
    val totalSize = (size /: links) { (sum, link) => sum + PageLoader.getPageSize(link) }
    println("Size for " + url + ": " + size + ", links : " + links.size + " total size : " + totalSize)
  }
}
// END:sequential

// START:concurrent
def getPageSizeConcurrently() = {
  val caller = self

  for(url <- urls) {
    actor {
      val (size, links) = PageLoader.getPageSizeAndLinks(url)
      val linkActor = self
      for(link <- links) {
        actor { linkActor ! PageLoader.getPageSize(link) }
      }
      var totalSize = size
      for(i <- 1 to links.size) {
        receive { case linkSize : Int => totalSize += linkSize }
      }
      caller ! (url, size, links, totalSize)
    }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url : String, size : Int, links : List[String], totalSize : Int) =>
      println("Size for " + url + ": " + size + ", links : " + links.size + " total size : " + totalSize)
    }
  }
}
// END:concurrent

// START:script
println("Sequential run:")
timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }
// END:script
