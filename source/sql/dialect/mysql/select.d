module sql.dialect.mysql.select;

import sql.dialect.mysql.table;
import sql.fields;
import sql.field;

class Select : sql.select.Select
{
    private Fields fields;
    private Table from;

    public this()
    {
        this.fields = new Fields();
    }

    unittest
    {
        Select query = new Select();
        assert(query.generate() == "SELECT NULL");
    }

    public this(Table from)
    {
        this();
        this.fields = new Fields(from);
        this.from   = from;
    }

    unittest
    {
        Select query = new Select(new Table("mytable"));
        assert(query.generate() == "SELECT NULL FROM `mytable`");
    }

    public string generate()
    {
        return "SELECT " ~ this.fields.generate();
    }

    public void select(Fields fields)
    {
        this.fields = fields;
    }

    unittest
    {
        Select query  = new Select();
        Fields fields = new Fields();
        Field  field  = new class Field
        {
            public string generate()
            {
                return "FooBar";
            }
        };
        fields.append(field);

        query.select(fields);

        assert(query.generate() == "SELECT FooBar");
    }
}
