module sql.fields;

import sql.part;
import sql.field;

class Fields : Part
{
    private string[] fields;

    unittest
    {
        Fields fields = new Fields();
        Field  field  = new class Field
        {
            public string generate()
            {
                return "`FooBar`";
            }
        };

        fields.append(field);

        assert(fields.generate() == "`FooBar`");
    }

    public string generate()
    {
        if (this.fields.length == 0)
        {
            return "NULL";
        }
        import std.array;
        return join(this.fields, ',');
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
