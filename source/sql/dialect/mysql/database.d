module sql.dialect.mysql.database;

import sql.dialect.mysql.schema;

class Database : sql.database.Database
{
	
	public sql.schema.Schema useSchema(string identifier)
	{
		return new Schema(identifier);
	}
	
} unittest {
	
	Database Database = new Database();
	sql.schema.Schema Schema = Database.useSchema("myschema");
	
}