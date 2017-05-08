module sql.dialect.mysql.select;

import sql.fields;
import sql.field;

class Select : sql.select.Select
{
    private Fields fields;

    public this(Fields fields)
    {
        this.fields = fields;
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
