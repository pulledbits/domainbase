module sql.dialect.mysql.schema;

class Schema : sql.schema.Schema
{
    private string identifier;

    public this(string identifier)
    {
        this.identifier = identifier;
    }
}
