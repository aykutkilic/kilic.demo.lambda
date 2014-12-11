package kilic.demo.arconf.semantics

import it.xsemantics.runtime.StringRepresentation
import kilic.demo.arconf.aRConf.One
import kilic.demo.arconf.aRConf.Any
import kilic.demo.arconf.aRConf.Optional
import kilic.demo.arconf.aRConf.OneOrMore
import kilic.demo.arconf.aRConf.Range
import kilic.demo.arconf.aRConf.Fixed

class ARConfStringRep extends StringRepresentation {
	def dispatch stringRep(One m) { "1" }
	def dispatch stringRep(Optional m) { "?" }
	def dispatch stringRep(Any m) { "*" }
	def dispatch stringRep(OneOrMore m) { "+" }
	def dispatch stringRep(Range m) { '[' + m.from + '..' + m.to + ']' }
	def dispatch stringRep(Fixed m) { '[' + m.count + ']' }
}
