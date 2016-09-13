module sql.table;

import sql.select;

class Table : Source {
	
	private string name;
	
	public this(string name) {
		this.name = name;
	}
	
} unittest {
	Table table = new Table("mytable");
	assert(table.name == "mytable");
}