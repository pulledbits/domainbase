class Table {
	
	private string identifier;
	
	public this(string identifier) {
		this.identifier = identifier;
	}
	
} unittest {
	Table table = new Table("mytable");
	assert(table.identifier == "mytable");
}