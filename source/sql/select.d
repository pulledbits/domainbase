import std.array;

interface Source {
	public string appendIdentifier(string query);
}

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
	
	public void select(string field) {	
		this.fields ~= field;
	}
	
} unittest {
	Select query = new Select(new class Source {
		public string appendIdentifier(string query) {
			return query ~ "mytable";
		}
	});
	assert(query.generate() == "SELECT * FROM mytable");
	
	query.select("foo");
	assert(query.generate() == "SELECT foo FROM mytable");
	
	query.select("bar");
	assert(query.generate() == "SELECT foo, bar FROM mytable");
}