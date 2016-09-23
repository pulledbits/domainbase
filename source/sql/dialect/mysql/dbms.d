module sql.dialect.mysql.dbms;

import sql.dialect.mysql.schema;

class DBMS : sql.dbms.DBMS
{
	
	public sql.schema.Schema useSchema(string identifier)
	{
		return new Schema(identifier);
	}
	
} unittest {
	
	DBMS dbms = new DBMS();
	sql.schema.Schema Schema = dbms.useSchema("myschema");
	
}