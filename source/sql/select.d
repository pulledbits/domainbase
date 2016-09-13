module sql.select;

import std.array;

interface Source {
	public string appendIdentifier(string query);
}

class Select {
	
	private string[] fields;
	private Source source;
	
	public this(Source source) {
		this.source = source;
		this.fields ~= "*";
	}
	
	public string generate() {
		return this.source.appendIdentifier("SELECT " ~ join(this.fields) ~ " FROM ");
	}
	
} unittest {
	Select query = new Select(new class Source {
		public string appendIdentifier(string query) {
			return query ~ "mytable";
		}
	});
	assert(query.generate() == "SELECT * FROM mytable");
}