component accessors="true" {
    property name="id"       default="";
	property name="name"    default="";
	property name="year"    default="";

    this.constraints = {
		name    : { required : true }
	};

    function init() {
		variables.permissions = [];

		return this;
	}
}