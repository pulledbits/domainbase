module sql.select;

import sql.table;

class Select {
	
	public this() {
	}
	
	public string generate() {
		return "SELECT NULL";
	}
	
} unittest {
	Select query = new Select();
	assert(query.generate() == "SELECT NULL");
}