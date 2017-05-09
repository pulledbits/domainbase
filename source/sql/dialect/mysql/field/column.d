module sql.dialect.mysql.field.column;

import sql.field;

class Column : Field
{
    private string sourceIdentifier;
    private string name;

    public this(string sourceIdentifier, string name)
    {
        this.sourceIdentifier = sourceIdentifier;
        this.name             = name;
    }

    public string generate()
    {
        return "`" ~ sourceIdentifier ~ "`.`" ~ name ~ "`";
    }

    unittest
    {
        Column field = new Column("foo", "bar");
        assert(field.generate() == "`foo`.`bar`");
    }
}
