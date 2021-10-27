module structures;

/*
    I used classes instead. It's okay to be mad about it.
*/

import std.stdio;
import std.string;
import std.array;
import std.algorithm.searching;


class Patient
{
    private Identifier  identifier;
    private bool        active;
}


class Identifier
{

}

// As opposed to an inhuman name, of course.
class HumanName
{
    private string text;
    private string family;
    private string given;
    private string prefix;
    private string suffix;

    public  string get_text()    { return this.text;     }
    public  string get_family()  { return this.family;   }
    public  string get_given()   { return this.given;    }
    public  string get_prefix()  { return this.prefix;   }
    public  string get_suffix()  { return this.suffix;   }
}

class ValueSet
{
    private string          url;
    private Identifier      identifier;
    private string          Version;    // 'version' is a keyword in D. :(
    private string          name;
    private string          title;
    private Code            status;
    private bool            experimental;
    // private date        date;    // http://hl7.org/fhir/datatypes.html#dateTime
    private string          publisher;
    private ContactDetail   contact;


    public  string       get_url()           { return this.url;          }
    public  Identifier   get_identifier()    { return this.identifier;   }
    public  string       get_name()          { return this.name;         }
    public  string       get_title()         { return this.title;        }
    public  Code         get_status()        { return this.status;       }
    public  bool         get_experimental()  { return this.experimental; }
}

class Code
{
    private string system;
    private string Version;
    private string code;
    private string display;

    public  string get_system()  { return this.system;   }
    public  string get_version() { return this.Version;  }
    public  string get_code()    { return this.code;     }
    public  string get_display() { return this.display;  }
}

class Period
{
}

class ContactDetail
{
    private string          name;
    private ContactPoint    telecom;
}

class ContactPoint
{
    private Code    system;
    private string  value;
    private Code    use;
    // private positiveInt rank;    0 or 1. Not 2, not 3, not 4. But 1.. or 0. Also, TODO: Implement this.
    private Period  period;

    public Code get_system()    { return this.system; }
    public string get_value()   { return this.value;  }
    public Code get_use()       { return this.use;    }
    public Period get_period()  { return this.period; }
}

class Markdown
{
    private string  raw_markdown;
    private string  markdown;

    public  string  get_raw_markdown()  { return this.raw_markdown;       }
    public  string  get_markdown()      { return this.markdown;           }
    public  bool    is_processed()      { return this.markdown.isNull;    }

    public string process_markdown()
    {
        if ( this.is_processed() )
            return this.markdown;

    // TODO: Process markdown.
    }
}