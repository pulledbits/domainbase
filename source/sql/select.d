module sql.select;

import sql.table;

class Select {
	
	private string tableIdentifier;
	
	public this() {
	}
	
	public string generate() {
		if (this.tableIdentifier is null) {
			return "SELECT NULL";
		}
		return "SELECT * FROM " ~ this.tableIdentifier;
	}
	
	public void from(string tableIdentifier)
	{
		this.tableIdentifier = tableIdentifier;
	}
	
} unittest {
	Select query = new Select();
	assert(query.generate() == "SELECT NULL");
	
	query.from("mytable");
	assert(query.generate() == "SELECT * FROM mytable");
}