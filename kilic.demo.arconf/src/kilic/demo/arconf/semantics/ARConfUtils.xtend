package kilic.demo.arconf.semantics

import kilic.demo.arconf.aRConf.ARConfFactory
import kilic.demo.arconf.aRConf.Multiplicity
import kilic.demo.arconf.aRConf.One
import kilic.demo.arconf.aRConf.Optional
import kilic.demo.arconf.aRConf.OneOrMore
import kilic.demo.arconf.aRConf.Any
import kilic.demo.arconf.aRConf.Range
import kilic.demo.arconf.aRConf.Fixed
import kilic.demo.arconf.aRConf.ModuleAsg
import kilic.demo.arconf.aRConf.ContainerAsg
import kilic.demo.arconf.aRConf.BasicAsg
import kilic.demo.arconf.aRConf.ContainerValMember
import kilic.demo.arconf.aRConf.ContainerDef
import kilic.demo.arconf.aRConf.ModuleDef
import kilic.demo.arconf.aRConf.RefDef
import kilic.demo.arconf.aRConf.ChoiceRefDef
import kilic.demo.arconf.aRConf.BasicItemDef
import it.xsemantics.runtime.StringRepresentation
import com.google.inject.Inject

class ARConfUtils {
	@Inject StringRepresentation rep
	
	def createBasicItemDef( String type ) {
		var result = ARConfFactory::eINSTANCE.createBasicItemDef
		result.type = type
		result
	}
	
	def createRefDef( ContainerDef containerDef ) {
		var result = ARConfFactory::eINSTANCE.createRefDef
		result.container = containerDef
		result
	}
	
	def dispatch String typename(ModuleDef m) { m.name + rep.string(m.mul)}
	def dispatch String typename(ContainerDef c) { c.name + rep.string(c.mul)}
	def dispatch String typename(RefDef r) { 
		"ref<"+typename(r.container)+">" + rep.string(r.mul)
	}
	def dispatch String typename(ChoiceRefDef r) '''
		«FOR c : r.containers BEFORE 'choice-ref<' SEPARATOR ',' AFTER '>'»«ENDFOR»«rep.string(r.mul)»
	'''
	def dispatch String typename(BasicItemDef b) { b.type + rep.string(b.mul) }
	
	def name(ModuleAsg    asg) { if( asg.name==null ) asg.type.name else asg.name }
	def name(ContainerValMember asg) { if( asg.name==null ) asg.type.name else asg.name }
	
	def expectMultiplicity(Multiplicity expected, int actual ) {
		switch(expected) {
			One:		actual==1
			Optional: 	actual==0 || actual==1
			OneOrMore:	actual>=1
			Any:		true
			Range:		actual>=expected.from && actual<=expected.to
			Fixed:		actual==expected.count
		}
	}
}