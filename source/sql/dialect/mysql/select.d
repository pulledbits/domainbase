module sql.dialect.mysql.select;

import sql.dialect.mysql.table;
import sql.fields;
import sql.field;

class Select : sql.select.Select
{
    private Fields fields;

    public this(Fields fields)
    {
        this.fields = fields;
    }

    unittest
    {
        Select query = new Select(new Fields(new Table("mytable")));
        assert(query.generate() == "SELECT NULL FROM `mytable`");
    }

    public string generate()
    {
        return "SELECT " ~ this.fields.generate();
    }

    unittest
    {
        Fields fields = new Fields();
        Select query  = new Select(fields);
        Field  field  = new class Field
        {
            public string generate()
            {
                return "FooBar";
            }
        };
        fields.append(field);

        assert(query.generate() == "SELECT FooBar");
    }
}
