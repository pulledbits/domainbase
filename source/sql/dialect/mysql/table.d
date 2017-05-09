module sql.dialect.mysql.table;

import sql.dialect.mysql.field.column;
import sql.source;


class Table : Source
{
    private string identifier;

    public this(string identifier)
    {
        this.identifier = identifier;
    }

    public string generate()
    {
        return "FROM " ~ this.escapedIdentifier();
    }

    unittest
    {
        Table table = new Table("mytable");
        assert(table.generate() == "FROM `mytable`");
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
