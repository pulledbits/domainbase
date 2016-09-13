module sql.table;

class Table {
	
	private string name;
	
	public this(string name) {
		this.name = name;
	}
	
} unittest {
	Table table = new Table("mytable");
	assert(table.name == "mytable");
}