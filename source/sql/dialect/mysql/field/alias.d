module sql.dialect.mysql.field.aliasfield;

import sql.field;

class AliasField : Field
{
    private string identifier;
    private Field field;

    public this(string identifier, Field field)
    {
        this.identifier = identifier;
        this.field      = field;
    }

    public string generate()
    {
        return this.field.generate()  ~ " AS " ~ this.identifier;
    }

    unittest
    {
        AliasField field = new AliasField("myAlias", new class Field {
            public string generate()
            {
                return "myField";
            }
        });
        assert(field.generate() == "myField AS myAlias");
    }
}
