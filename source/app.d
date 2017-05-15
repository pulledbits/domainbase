import std.stdio;
import mysql.d;

void main()
{
    writeln("Hello World.");

    auto mysql   = new Mysql("localhost", 3306, "teach", "teach", "teach");
    auto ratings = mysql.query("SELECT waarde FROM rating ORDER BY updated_at DESC");
    foreach (rating; ratings)
    {
        writefln("Rating: %s", rating["waarde"]);
    }
}
