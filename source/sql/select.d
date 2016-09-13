module sql.select;

interface Source {
	
}

class Select {
	
	private Source source;
	
	public this(Source source) {
		this.source = source;
	}
	
	public string generate() {
		return "SELECT * FROM `mytable`";
	}
	
} unittest {
	Select query = new Select(new class Source {
			
	});
	assert(query.generate() == "SELECT * FROM `mytable`");
}