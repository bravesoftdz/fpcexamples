program stringexamples;
{$mode objfpc} // Don't forget

uses
    classes, strings, strutils, RegExpr;

var
    SubStrings: TStringList;
    SubString: String;
    FooPattern: TRegExpr;
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
        FooPattern := TRegExpr.Create();
        FooPattern.Expression := '';
    finally
        FooPattern.Free;
    end;
end.
