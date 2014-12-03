package kilic.demo.lambda.typing

import kilic.demo.lambda.lambda.LambdaFactory
import kilic.demo.lambda.lambda.BasicType
import kilic.demo.lambda.lambda.ArrowType
import kilic.demo.lambda.lambda.Type

class LambdaUtils {
	def BasicType createBasicType(String letter) {
		var basicType = LambdaFactory::eINSTANCE.createBasicType
		basicType.letter = letter.toUpperCase
		basicType
	}
	
	def ArrowType createArrowType(Type left, Type right) {
		var arrowType = LambdaFactory::eINSTANCE.createArrowType
		arrowType.left = left
		arrowType.right = right
		arrowType
	}
	
	dispatch def boolean equals( ArrowType a, ArrowType b ) {
		equals(a.left, b.left)
		equals(a.right, b.right)
	}
	
	dispatch def boolean equals( BasicType a, BasicType b ) {
		a.letter.equals(b.letter)
	}
	
	dispatch def boolean equals( Type a, Type b ) {
		a.class == b.class
	}
}