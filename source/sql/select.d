module sql.select;

import sql.table;
import std.array;

class Select {
	
	private string tableIdentifier;
	private string[] fields;
	
	public this() {
	}
	
	public string generate() {
		string source = "";
		if (this.tableIdentifier !is null) {
			source = " FROM " ~ this.tableIdentifier;
		} else if (this.fields.length == 0) {
			return "SELECT NULL";
		}
		
		string fieldsSQL;
		if (this.fields.length == 0) {
			fieldsSQL = "*";
		} else {
			fieldsSQL = join(this.fields, ',');
		}
		return "SELECT " ~ fieldsSQL ~ source;
	}
	
	public void from(string tableIdentifier)
	{
		this.tableIdentifier = tableIdentifier;
	}
	
	public void select(string text) 
	{
		this.fields ~= '"' ~ text ~ '"';
	}
	
	public void select(string text, string as) 
	{
		this.fields ~= '"' ~ text ~ "\" AS " ~ as;
	}
	
} unittest {
	Select query = new Select();
	assert(query.generate() == "SELECT NULL");
	
	
	query = new Select();
	query.from("mytable");
	assert(query.generate() == "SELECT * FROM mytable");
	
	query = new Select();
	query.select("foobar");
	assert(query.generate() == "SELECT \"foobar\"");
	
	query = new Select();
	query.select("foo", "bar");
	assert(query.generate() == "SELECT \"foo\" AS bar");
	
}