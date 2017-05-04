module sql.database;

interface Database
{
    public sql.schema.Schema useSchema(string identifier);
}
