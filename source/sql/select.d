module sql.select;

interface Source {
	public string appendIdentifier(string query);
}

class Select {
	
	private Source source;
	
	public this(Source source) {
		this.source = source;
	}
	
	public string generate() {
		return this.source.appendIdentifier("SELECT * FROM ");
	}
	
} unittest {
	Select query = new Select(new class Source {
		public string appendIdentifier(string query) {
			return query ~ "mytable";
		}
	});
	assert(query.generate() == "SELECT * FROM mytable");
}