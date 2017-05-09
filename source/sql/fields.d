module sql.fields;

import sql.part;
import sql.field;
import std.array;

class Fields : Part
{
    private string sourceEscapedIdentifier;
    private string[] fields;

    this() {
    }

    this(string sourceEscapedIdentifier) {
        this.sourceEscapedIdentifier = sourceEscapedIdentifier;
    }
    unittest
    {
        Fields fields = new Fields("`mytable`");
        assert(fields.generate() == "NULL FROM `mytable`");
    }

    unittest
    {
        Fields fields = new Fields("`mytable`");
        Field  field  = new class Field
        {
            public string generate()
            {
                return "`FooBar`";
            }
        };

        fields.append(field);

        assert(fields.generate() == "`FooBar` FROM `mytable`");
    }

    public string generate()
    {
        string fieldsSQL = "";
        if (this.fields.length == 0)
        {
            fieldsSQL ~= "NULL";
        }
        else
        {
            fieldsSQL ~= join(this.fields, ',');
        }

        if (this.sourceEscapedIdentifier !is null)
        {
            return fieldsSQL ~ " FROM " ~ this.sourceEscapedIdentifier;
        }
        return fieldsSQL;
    }

    public void append(Field field)
    {
        this.fields ~= field.generate();
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

        assert(fields.generate() == "FooBar");
    }
}
