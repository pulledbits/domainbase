import std.array;
import column;


class Select {
	
	private string[] fields;
	private Source source;
	
	public this(Source source) {
		this.source = source;
	}
	
	public string generate() {
		string fields;
		if (this.fields.length == 0) {
			fields = "*";
		} else {
			fields = join(this.fields, ", ");
		}
		return this.source.appendIdentifier("SELECT " ~ fields ~ " FROM ");
	}
	
	public void select(Column column) {
		this.fields ~= column.identify();
	}
	
	
} unittest {
	Source table = new class Source {
		public string appendIdentifier(string query) {
			return query ~ "mytable";
		}
	};
	
	Select query = new Select(table);
	assert(query.generate() == "SELECT * FROM mytable");
	
	query.select(new Column("foo", table));
	assert(query.generate() == "SELECT mytable.foo FROM mytable");
	
	query.select(new Column("bar", table));
	assert(query.generate() == "SELECT mytable.foo, mytable.bar FROM mytable");
	
	query.select(new Column("test", table));
	assert(query.generate() == "SELECT mytable.foo, mytable.bar, mytable.test FROM mytable");
}