
interface Source {
	public string appendIdentifier(string query);
}

class Column {
	
	private string name;
	private Source source;
	
	public this(string name, Source source) {
		this.name = name;
		this.source = source;
	}
	
	public string identify() {
		return this.source.appendIdentifier("") ~ "." ~ this.name;
	}
	
} unittest {
	Column column = new Column("mycolumn", new class Source {
		public string appendIdentifier(string query) {
			return query ~ "mytable";
		}
	});
	assert(column.identify() == "mytable.mycolumn");
}