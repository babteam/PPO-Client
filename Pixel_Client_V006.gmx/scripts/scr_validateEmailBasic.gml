var input = argument[0];

var result = false;
var atCount = 0;


for (var i = 0; i < string_length(input); i++)
{
    if (string_char_at(input, i) == '@')
    {
        atCount++;
    }
}

if (atCount == 1)
{
    result = true;
}

return result;
