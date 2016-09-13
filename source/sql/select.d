module sql.select;

import sql.table;
import std.array;

class Select {
	
	private string tableIdentifier;
	private string[] fields;
	
	public this() {
	}
	
	public string generate() {
		if (this.tableIdentifier is null) {
			return "SELECT NULL";
		}
		string fieldsSQL;
		if (this.fields.length == 0) {
			fieldsSQL = "*";
		} else {
			fieldsSQL = join(this.fields, ',');
		}
		return "SELECT " ~ fieldsSQL ~ " FROM " ~ this.tableIdentifier;
	}
	
	public void from(string tableIdentifier)
	{
		this.tableIdentifier = tableIdentifier;
	}
	
	public void select(string text) 
	{
		this.fields ~= '"' ~ text ~ '"';
	}
	
} unittest {
	Select query = new Select();
	assert(query.generate() == "SELECT NULL");
	
	query.from("mytable");
	assert(query.generate() == "SELECT * FROM mytable");
	
	query.select("foobar");
	assert(query.generate() == "SELECT \"foobar\" FROM mytable");
	
}