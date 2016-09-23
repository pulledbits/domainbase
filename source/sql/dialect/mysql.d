module sql.dialect.mysql;

import sql.queries;
import sql.field;

import std.array;

class Select : sql.queries.Select
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
	
	public void select(Field field) 
	{
		this.fields ~= field.generate();
	} 
	unittest {
		Select query = new Select();
		query.select(new class Field {
			public string generate() {
				return "FooBar";
			}
		});
		assert(query.generate() == "SELECT FooBar");
	}
	
	public void select(Field field, string as) 
	{
		this.fields ~= field.generate() ~ " AS " ~ as;
	} 
	unittest {
		Select query = new Select();
		query.select(new class Field {
			public string generate() {
				return "FooBar";
			}
		}, "bar");
		assert(query.generate() == "SELECT FooBar AS bar");
	}
} 
unittest {
	Select query = new Select();
	assert(query.generate() == "SELECT NULL");
}