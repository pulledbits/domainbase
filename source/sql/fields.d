module sql.fields;

import sql.part;
import sql.field;
import std.array;

class Fields : Part
{
    private string[] fields;

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

    public void append(Field field, string as)
    {
        this.fields ~= field.generate() ~ " AS " ~ as;
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
        fields.append(field, "bar");
        assert(fields.generate() == "FooBar AS bar");
    }
}
