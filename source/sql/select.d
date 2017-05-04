module sql.select;

import sql.part;
import sql.fields;
import sql.field;

interface Select : Part
{
    public void select(Fields fields);
}
