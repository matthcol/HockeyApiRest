/**
 * I am a new Model Object
 */
component accessors="true"{

	// Properties
	property name="id" type="string";
	property name="name" type="string";
	property name="abbreviation" type="string";
	property name="city" type="string";
	property name="firstYearOfPlay" type="numeric";
	property name="active" type="boolean";

	/**
	 * Constructor
	 */
	Team function init(){

		return this;
	}


}