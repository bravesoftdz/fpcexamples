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

    DateStr1: String;
    DateStr2: String;
    DatePatternStr: String;
    DatePattern: TRegExpr;
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

    // Regex match
    // Init strings
    DateStr1 := '2015-09-18';
    DateStr2 := 'SO15-09-18';
    DatePatternStr := '\d{4}-\d{2}-\d{2}';

    // Create pattern
    try
        DatePattern := TRegExpr.Create;
        DatePattern.Expression := DatePatternStr;
        DatePattern.Compile;
    finally
    end;

    // Execute pattern
    try
    begin
        // Correctly formatted date
        if DatePattern.Exec(DateStr1) then
            WriteLn('Date ' + DateStr1 + ' matches pattern ' + DatePatternStr + '!')
        else
            WriteLn('Date ' + DateStr1 + ' does not match pattern ' + DatePatternStr + '!');

        // Wrongly formatted date
        if DatePattern.Exec(DateStr2) then
            WriteLn('Date ' + DateStr2 + ' matches pattern ' + DatePatternStr + '!')
        else
            WriteLn('Date ' + DateStr2 + ' does not match pattern ' + DatePatternStr + '!');
    end;
    except
        WriteLn('Failed to execute regex!');
    end;
end.
