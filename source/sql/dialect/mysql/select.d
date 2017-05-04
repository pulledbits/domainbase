module sql.dialect.mysql.select;

import sql.dialect.mysql.table;
import sql.field;

import std.array;

class Select : sql.select.Select {
	private string[] fields;
	private Table from;

	public this() {
	}
	unittest {
		Select query = new Select();
		assert(query.generate() == "SELECT NULL");
	}

	public this(Table from) {
		this.from = from;
	}
	unittest {
		Select query = new Select(new Table("mytable"));
		assert(query.generate() == "SELECT NULL FROM `mytable`");
	}

	public string generate() {
		string query = "SELECT";
		string source = "";

		if (this.from !is null) {
			source = " FROM `mytable`";
		}

		string fieldsSQL = " ";
		if (this.fields.length == 0) {
			fieldsSQL ~= "NULL";
		} else {
			fieldsSQL ~= join(this.fields, ',');
		}

		return query ~ fieldsSQL ~ source;
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
