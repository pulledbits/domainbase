module sql.dialect.mysql.table;

import sql.dialect.mysql.select;
import sql.dialect.mysql.field.column;

class Table
{
    private string identifier;

    public this(string identifier)
    {
        this.identifier = identifier;
    }

    public Select select()
    {
        return new Select();
    }

    unittest
    {
        Table table = new Table("mytable");
        Select query = table.select();
        assert(query.generate() == "SELECT NULL");
    }

}

unittest
{
    Table table = new Table("mytable");
    assert(table.identifier == "mytable");
}
