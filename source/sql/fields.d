module sql.fields;

import sql.part;
import sql.field;
import sql.source;
import std.array;

class Fields : Part
{
    private Source source;
    private string[] fields;

    this() {
    }

    this(Source source) {
        this.source = source;
    }
    unittest
    {
        Fields fields = new Fields(new class Source
        {
            public string generate()
            {
                return "FROM " ~ this.escapedIdentifier();
            }

            public string escapedIdentifier()
            {
                return "`mytable`";
            }
        });
        assert(fields.generate() == "NULL FROM `mytable`");
    }

    unittest
    {
        Fields fields = new Fields(new class Source
        {
            public string generate()
            {
                return "FROM " ~ this.escapedIdentifier();
            }

            public string escapedIdentifier()
            {
                return "`mytable`";
            }
        });
        Field field = new class Field
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

        if (this.source !is null)
        {
            return fieldsSQL ~ " " ~ this.source.generate();
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
