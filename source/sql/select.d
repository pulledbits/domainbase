module sql.select;

import sql.table;

class Select {
	
	private Table source;
	
	public this() {
	}
	
	public string generate() {
		return "SELECT NULL";
	}
	
} unittest {
	Select query = new Select();
	assert(query.generate() == "SELECT NULL");
}