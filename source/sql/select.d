module sql.select;

import sql.table;

class Select {
	
	private Table source;
	
	public this(Table source) {
		this.source = source;
	}
	
	public string generate() {
		return "SELECT * FROM `mytable`";
	}
	
} unittest {
	Select query = new Select(new Table("mytable"));
	assert(query.generate() == "SELECT * FROM `mytable`");
}