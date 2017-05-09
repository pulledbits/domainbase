module sql.select;

import sql.part;
import sql.fields;
import sql.field;

class Select : Part
{
    private string sourceEscapedIdentifier;
    private Fields fields;

    public this(Fields fields)
    {
        this.fields = fields;
    }
    unittest
    {
        Fields fields = new Fields();
        Field  field  = new class Field
        {
            public string generate()
            {
                return "FooBar";
            }
        };
        fields.append(field);
        Select query = new Select(fields);

        assert(query.generate() == "SELECT FooBar");
    }

    public this(Fields fields, string sourceEscapedIdentifier)
    {
        this.fields                  = fields;
        this.sourceEscapedIdentifier = sourceEscapedIdentifier;
    }
    unittest
    {
        Fields fields = new Fields();
        Select query  = new Select(fields, "`mytable`");
        assert(query.generate() == "SELECT NULL FROM `mytable`");
    }

    public string generate()
    {
        string sql = "SELECT " ~ this.fields.generate();
        if (this.sourceEscapedIdentifier !is null)
        {
            sql ~= " FROM " ~ this.sourceEscapedIdentifier;
        }
        return sql;
    }
}
