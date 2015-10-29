program stringexamples;
{$mode objfpc} // Don't forget

uses
    classes, strings, strutils;

var
    SubStrings: TStringList;
    SubString: String;
begin
    // Splitting strings
    SubStrings := TStringList.Create;
    SubStrings.Delimiter := ':';
    SubStrings.StrictDelimiter := True;
    SubStrings.DelimitedText := 'Foo:Bar';
    for SubString in SubStrings
    do
        WriteLn('SubString: ' + SubString);
    end.
end.
