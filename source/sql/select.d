module sql.select;

import sql.table;
import std.array;
import std.conv;

class Select 
{
	
	private string[] fields;
	
	public this() {
	}
	
	public string generate() {
		string source = "";
		if (this.fields.length == 0) {
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
	
	public void selectValue(string text) 
	{
		this.fields ~= '"' ~ text ~ '"';
	} 
	unittest {
		Select query = new Select();
		query.selectValue("foobar");
		assert(query.generate() == "SELECT \"foobar\"");
	}
	
	public void selectValue(string text, string as) 
	{
		this.fields ~= '"' ~ text ~ "\" AS " ~ as;
	} 
	unittest {
		Select query = new Select();
		query.selectValue("foo", "bar");
		assert(query.generate() == "SELECT \"foo\" AS bar");
	}
	
	public void selectColumn(string tableIdentifier, string name) 
	{
		this.fields ~= tableIdentifier ~ '.' ~ name;
	} 
	unittest {
		Select query = new Select();
		query.selectColumn("foo", "bar");
		assert(query.generate() == "SELECT foo.bar");
	}
} 
unittest {
	Select query = new Select();
	assert(query.generate() == "SELECT NULL");
}