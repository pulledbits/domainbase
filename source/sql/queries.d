module sql.queries;

import sql.part;
import sql.field;

interface Select : Part {
	
	public void select(Field field);
	public void select(Field field, string as);
	
}