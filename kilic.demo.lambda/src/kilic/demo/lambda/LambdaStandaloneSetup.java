/*
* generated by Xtext
*/
package kilic.demo.lambda;

/**
 * Initialization support for running Xtext languages 
 * without equinox extension registry
 */
public class LambdaStandaloneSetup extends LambdaStandaloneSetupGenerated{

	public static void doSetup() {
		new LambdaStandaloneSetup().createInjectorAndDoEMFRegistration();
	}
}

