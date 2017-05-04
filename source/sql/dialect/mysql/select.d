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
    }

    unittest
    {
        Select query = new Select();
        assert(query.generate() == "SELECT NULL");
    }

    public this(Table from)
    {
        this.from = from;
    }

    unittest
    {
        Select query = new Select(new Table("mytable"));
        assert(query.generate() == "SELECT NULL FROM `mytable`");
    }

    public string generate()
    {
        string query  = "SELECT";
        string source = "";

        if (this.from !is null)
        {
            source = " FROM `mytable`";
        }

        if (this.fields is null)
        {
            query ~= " NULL";
        }
        else
        {
            query ~= " " ~ this.fields.generate();
        }

        return query ~ source;
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
