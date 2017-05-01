---
layout: post
title: How to create relative links in MS Word via MS Excel using Visual Basic
---

I recently had to do a bunch of work in Visual Basic for Applications and wire together a Word document with an Excel spreadsheet. This blog post documents all the things I wish I'd found via googling. 

I assume you're reading this because it came up via a search engine, so I put all the snippets first and my motivating story at the end.

All of the following snippets of code are executed within the context of a Word document. I lightly edited the code and changed some variable and function names, so I make no guarantees that the code will copy and paste in without errors.

### How to open an Excel document with user input, from a Word document

First, make sure you add a reference to Microsoft Excel Objects via the Tools menu.

<pre>
Dim xl As Excel.Application
Dim wkbk As Excel.Workbook
Dim ex_sheet As Excel.Worksheet
Dim t_sheet As Excel.Worksheet
Dim j_sheet As Excel.Worksheet

Set xl = Excel.Application

fileToOpen = xl.GetOpenFilename

If fileToOpen = "False" Then
    MsgBox "Sorry, gotta pick a file!"
    End
End If

Set wkbk = xl.Workbooks.Open(fileToOpen)
Set ex_sheet = wkbk.Sheets(1)
Set t_sheet = wkbk.Sheets(2)
Set j_sheet = wkbk.Sheets(3)

' do work here

wkbk.Close SaveChanges:=False
</pre>


### How to search through every part of a Word document, given a wildcard pattern

One of the workhorses in Microsoft Office is the concept of a 'Range', which represents a subset of the document you're editing. You execute searches on a Range, which will then 'select' the sub-subset of the document you're interested in. A Word document, as far as I can tell, consists of many 'Stories', which stand in for the different sections of the document. 

In order to search through an _entire_ document (i.e. main body, headers, footnotes, etc), we must iterate through the Range that represents each 'Story'. Also, a Story may contain subranges. I found the original source of this code through VBA documentation.

<pre>
' provide this function with a Word document, and an Excel Worksheet
' you can pass down to your 'DoTheWorkWeWant' sub function.
' in our case this will be the 'AddHyperlinkToARange' function from the next
' code block

Function SearchDocument(curdoc As Document, ex_sheet As Excel.Worksheet)
  Dim count As Integer
  Dim mypattern As String
  Dim sRange As Range

  count = 0
  mypattern = "YOUR WILDCARD PATTERN HERE"

  ' by default, i.e. the Selection.Find range, Word won't
  ' search thru every single part of the document. So, we
  ' instead have to iterate over every 'story'/doc section
  ' and search those ranges individually.

  For Each sRange In curdoc.StoryRanges

      ExecuteSearch sRange, mypattern
      While sRange.Find.Found

          ' having found a search hit, we dispatch
          ' this to a sub function; pick a better name
          DoTheWorkWeWant sRange, count, ex_sheet

          ' necessary for moving the range forward
          ' or else when we reexecute the search
          ' it'll just start at the beginning again
          ' see superuser.com/questions/1009085
          sRange.Collapse Direction:=wdCollapseEnd
          count = count + 1

          sRange.Find.Execute
      Wend

      ' but, apparently, each StoryRange is also
      ' composed of many sub-ranges, so you have to 
      ' also iterate over the StoryRange substories?
      ' This was copied from Msft documentation.

      While Not (sRange.NextStoryRange Is Nothing)
          Set sRange = sRange.NextStoryRange

          ExecuteSearch sRange, mypattern
          While sRange.Find.Found

              DoTheWorkWeWant sRange, count, ex_sheet
              sRange.Collapse Direction:=wdCollapseEnd
              count = count + 1

              sRange.Find.Execute
          Wend


      Wend
  Next
End Function

Function ExecuteSearch(sRange As Range, mypattern As String)
    With sRange.Find
        .ClearFormatting
        .Text = mypattern
        .Forward = True
        .Wrap = wdFindStop
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchAllWordForms = False
        .MatchSoundsLike = False
        .MatchWildcards = True
        .Execute
    End With
End Function
</pre>

### How to insert a relative hyperlink into a Word document

<pre>
' DoTheWorkWeWant from the function provided above
' Assumes ActiveDocument is the word doc you want to edit,
' and that you're provided with an Excel file to edit

Function AddHyperlinkToARange(sr As Range, count As Integer, wsheet As Worksheet)
    ' sanity check to prevent infinite loops
    ' if you make a mistake in your code that
    ' iterates thru Word document searches,
    ' this can end up in an infinite loop
    If count > 2000 Then
        End
    End If


    ' in the problem I had to solve,
    ' I had to extract two numbers from the
    ' provided substring
    Dim info() As String
    info = ExtractSearchInformation(sr.Text)


    If info(0) <> "" Then
        hyperlink = FetchHyperlinkFromExcel(wsheet, info(0), info(1))

        If hyperlink <> "" Then
        ' note the "..\" string
        ' in our case, the files we were referencing were one file path down
            ActiveDocument.Hyperlinks.Add Anchor:=sr, Address:="..\" & hyperlink
        End If
    End If
End Function
</pre>

### How to search through two Excel Worksheet columns at the same time

<pre>
Function FetchHyperlinkFromExcel(wsheet As Excel.Worksheet, colAValue As String, colBValue As String)
    Dim cRange As Excel.Range
    Dim cFound As Excel.Range

    ' we set a range on the full A columns
    ' so we only search within there

    Set cRange = wsheet.Columns("A:A")
    Dim hyperlink As String

    ' xl's Range.Find works a bit differently.
    ' gotta be careful to specify LookAt:=xlWhole, or else it'll
    ' match substrings, which is NOT what we want

    Set cFound = cRange.Find(colAValue, LookIn:=xlValues, LookAt:=xlWhole)
    
    If Not cFound Is Nothing Then
        ' the only way to avoid infinite loops, apparently, is to keep
        ' track of the first found address and loop until we see it again
        cFirstAddress = cFound.Address

        ' the format we're looking for depends on two columns (A,B)
        ' so once we find the first column, we refine our search
        ' by iterating over every found row and peeking inside the B col

        ' Debug.Print "addr: " & cFound.Row & "x" & cFound.Column
        foundColB = wsheet.Cells(cFound.Row, 2).Value


        ' if the foundColB is empty AND our colBValue is empty, we
        ' found what we're looking for
        If (IsEmpty(foundColB) And colBValue = "") Or foundColB = colBValue Then
            ' in this case, we were looking for the value of 4th column
            hyperlink = wsheet.Cells(cFound.Row, 4).Value
        Else
            Do
                Set cFound = cRange.FindNext(cFound)
                foundColB = wsheet.Cells(cFound.Row, 2).Value
                If foundColB = colBValue Then
                    hyperlink = wsheet.Cells(cFound.Row, 4).Value
                End If
            Loop Until (foundColB = colBValue) Or (cFound.Address = cFirstAddress)
        End If

    End If
    FetchHyperlinkFromExcel = hyperlink
End Function
</pre>

### How to create a new Word file and write any given text to it

<pre>
' note that this will shift your ActiveDocument
Set logger = Word.Application.Documents.Add
logger.Content.InsertAfter Text:="This is the dumbest, easiest way" & vbNewLine
</pre>

---

## Why did you do this?

Recently, as a favour, I was asked to step in and perform some Microsoft Office automation. 

A legal firm was producing a lengthy court submission with thousands of citations. These citations all referenced existing files. This submission would be delivered on a USB key along side the files it cited.  The trick was, they wanted their submitted document to link directly to these files, as they came up in footnotes. Like any website, except only referencing a local filesystem.

They were _extremely_ short for time, the intern that normally handled this was away on exams, and every other computer person they knew turned them down. All I had to do was parse a spreadsheet, search through a Word file and insert a relative link in the right place. 

I said sure, how hard could it be? and promptly wildly underestimated how long this task would take me.

<figure>
<img src="/img/vb-stackoverflow.png" alt="A graph representing the number of visits I usually make to StackOverflow">
<figcaption>A graph representing the number of visits I usually make to StackOverflow</figcaption>
</figure>

I've spent enough time in my career parsing OpenOffice documents to know that, while I _could probably_ crack open MS Word files using some half-baked library, down that path also lies madness.

I rolled up my sleeves and dug into Visual Basic for Applications.[^officeautomation] This proved to be challenging,[^lolvba] mostly because of the runtime: it obviously hasn't been updated in ten or fifteen years, and the version I was dealing with couldn't be bothered to give me line numbers when errors occurred. I lost hours and hours fighting cryptic syntax and runtime errors and runtime errors reported as syntax errors.[^vbagripes]


[^lolvba]: A few years ago, [in a post about Brendan Eich](/2014/only-correct-way-think-brendan-eich.html), I'd joked about Microsoft VisualBasicScript winning the browser scripting wars; this experience gave me a new appreciation for how reasonable Javascript is in comparison.

[^officeautomation]: As far as I can tell this is still the Best Way to automate things in MS Office. I probably could've done this in .NET, but that would involve installing .NET runtimes on aggressively locked down Windows laptops, and that felt like a non-starter.

[^vbagripes]: VBA at a glance seems loosely typed, but is in fact strongly, statically typed. It's not smart enough to infer types returned from methods. It distinguishes between primitives and objects with different syntax. It ships with poor support for even basic data structures. Etc, etc.
