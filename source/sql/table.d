module sql.table;

import sql.select;

class Table : Source {
	
	private string name;
	
	public this(string name) {
		this.name = name;
	}
	
	public string appendIdentifier(string query) {
		return query ~ this.name;
	}
	
} unittest {
	Table table = new Table("mytable");
	assert(table.appendIdentifier("abc ") == "abc mytable");
}