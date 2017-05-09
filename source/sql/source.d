module sql.source;

import sql.part;

interface Source : Part
{
    string escapedIdentifier();
}
