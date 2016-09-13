class Column {
	
	private string name;
	
	public this(string name) {
		this.name = name;
	}
	
} unittest {
	Column column = new Column("mycolumn");
	assert(column.name == "mycolumn");
}