

class Column {
	
	private string tableIdentifier;
	private string name;
	
	public this(string tableIdentifier, string name) 
	{
		this.tableIdentifier = tableIdentifier;
		this.name = name;
	}
	
	public string generate()
	{
		return tableIdentifier ~ '.' ~ name;
	}
	unittest {
		Column field = new Column("foo", "bar");
		assert(field.generate() == "foo.bar");
	}
}