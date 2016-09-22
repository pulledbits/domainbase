
import field;

class Value : Field {
	
	private string text;
	
	public this(string text) 
	{
		this.text = text;
	}
	
	public string generate()
	{
		return '"' ~ text ~ '"';
	}
	unittest {
		Value field = new Value("foobar");
		assert(field.generate() == "\"foobar\"");
	}
}