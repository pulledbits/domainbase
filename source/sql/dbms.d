module sql.dbms;

interface DBMS
{
	
	public sql.schema.Schema useSchema(string identifier);
}