module sql.fields;

import sql.part;
import sql.field;
import sql.dialect.mysql.table;
import std.array;

class Fields : Part
{
    private Table source;
    private string[] fields;

    this() {
    }

    this(Table source) {
        this.source = source;
    }
    unittest
    {
        Fields fields = new Fields(new Table("mytable"));
        assert(fields.generate() == "NULL FROM `mytable`");
    }

    unittest
    {
        Fields fields = new Fields(new Table("mytable"));
        Field  field  = new class Field
        {
            public string generate()
            {
                return "`FooBar`";
            }
        };

        fields.append(field);

        assert(fields.generate() == "`mytable`.`FooBar` FROM `mytable`");
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
            return fieldsSQL ~ " FROM " ~ this.source.escapedIdentifier();
        }
        return fieldsSQL;
    }

    public void append(Field field)
    {
        string fieldSQL = "";
        if (this.source !is null)
        {
            fieldSQL ~= this.source.escapedIdentifier ~ ".";
        }
        this.fields ~= fieldSQL ~ field.generate();
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
