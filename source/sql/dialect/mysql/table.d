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

    public string escapedIdentifier()
    {
        return "`" ~ this.identifier ~ "`";
    }

    unittest
    {
        Table table = new Table("mytable");
        assert(table.escapedIdentifier() == "`mytable`");
    }
}

unittest
{
    Table table = new Table("mytable");
    assert(table.identifier == "mytable");
}
