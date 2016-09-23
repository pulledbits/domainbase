import select;
import sql.column;

class Table {
	
	private string identifier;
	
	public this(string identifier) {
		this.identifier = identifier;
	}
	
	public Select select(string column)
	{
		Select query = new Select();
		query.select(new Column(this.identifier, column));
		return query;
	}
	unittest {
		Table table = new Table("mytable");
		Select query = table.select("mycolumn");
		
		assert(query.generate() == "SELECT mytable.mycolumn");
	}
	
} unittest {
	Table table = new Table("mytable");
	assert(table.identifier == "mytable");
}