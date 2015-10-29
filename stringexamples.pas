program stringexamples;
{$mode objfpc} // Don't forget

uses
    classes, strings, strutils, RegExpr;

var
    SubStrings: TStringList;
    SubString: String;
    FooPattern: TRegExpr;

    SubjectStr: String;
    NewStr: String;
begin
    // Splitting strings
    try
        SubStrings := TStringList.Create;
        SubStrings.Delimiter := ':';
        SubStrings.StrictDelimiter := True;
        SubStrings.DelimitedText := 'Foo:Bar';
        for SubString in SubStrings do
            WriteLn('SubString: ' + SubString);
    finally
        SubStrings.Free;
    end;

    // Regex replacement
    try
        SubjectStr := 'Foo:Bar';

        FooPattern := TRegExpr.Create();
        FooPattern.Expression := '(.*):(.*)';
        WriteLn('Before replace: ' + SubjectStr);
        try
            NewStr := FooPattern.Replace(SubjectStr, 'The string contained $1 and $2', True);
        except
            WriteLn('Failed to replace!');
        end;
        WriteLn('After replace:  ' + NewStr)
    finally
        FooPattern.Free;
    end;
end.
