{
  ...
}:

{
  zen.programs.gui.libreoffice = {
    description = ''
      good office suite
      use with zathura
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.libreoffice = {
          enable = true;
          package = pkgs.libreoffice-stable;

          settings = {
            "/org.openoffice.Office.BasicIDE/Autocomplete" = {
              AutoCorrect = true;
              AutocloseDoubleQuotes = true;
              AutocloseParenthesis = true;
              AutocloseProc = true;
              CodeComplete = true;
              UseExtended = true;
            };

            "/org.openoffice.Office.Common/Misc" = {
              FirstRun = false;
              ShowTipOfTheDay = false;
              SymbolStyle = "auto";
              UseOpenCL = true;
            };

            "/org.openoffice.Office.Common/Print/Option/File" = {
              ReducedBitmapIncludesTransparency = true;
              ReducedBitmapMode = 1;
              ReducedBitmapResolution = 3;
              ReducedGradientMode = 0;
              ReducedGradientStepCount = 64;
              ReducedTransparencyMode = 0;
            };

            "/org.openoffice.Office.Common/Print/Option/Printer" = {
              ReducedBitmapIncludesTransparency = true;
              ReducedBitmapMode = 1;
              ReducedBitmapResolution = 3;
              ReducedGradientMode = 0;
              ReducedGradientStepCount = 64;
              ReducedTransparencyMode = 0;
            };

            "/org.openoffice.Office.Compatibility/AllFileFormats/org.openoffice.Office.Compatibility:FormattingOptions['_default']" =
              {
                ExpandWordSpace = true;
              };

            "/org.openoffice.Office.Linguistic/SpellChecking" = {
              IsReverseDirection = false;
              IsSpellAuto = true;
              IsSpellClosedCompound = true;
              IsSpellHyphenatedCompound = true;
              IsSpellSpecial = true;
              IsSpellUpperCase = true;
              IsSpellWithDigits = false;
            };

            "/org.openoffice.Office.UI/ColorScheme" = {
              CurrentColorScheme = "COLOR_SCHEME_LIBREOFFICE_AUTOMATIC";
            };

            "/org.openoffice.Office.UI.ToolbarMode" = {
              ActiveCalc = "notebookbar.ui";
              ActiveDraw = "notebookbar.ui";
              ActiveImpress = "notebookbar.ui";
              ActiveWriter = "notebookbar.ui";
            };

            "/org.openoffice.Office.Writer/Content/Display" = {
              DefaultAnchor = 1;
              DrawingControl = true;
              GraphicObject = true;
              Note = true;
              SectionBoundaries = true;
              ShowBoundaries = true;
              ShowContentTips = true;
              ShowInlineTooltips = true;
              Table = true;
              TableBoundaries = true;
              TextBoundaries = true;
              UseHeaderFooterMenu = true;
            };

            "/org.openoffice.Office.Writer/Content/NonprintingCharacter" = {
              Bookmarks = true;
              Break = true;
              ParagraphEnd = true;
              ProtectedSpace = true;
              Space = true;
              Tab = true;
            };

            "/org.openoffice.Office.Writer/Content/Update" = {
              Chart = true;
              Field = true;
              Link = 1;
            };

            "/org.openoffice.Office.Writer/Content/Zoom" = {
              DefaultZoom = true;
              ZoomType = 0;
              ZoomValue = 100;
            };

            "/org.openoffice.Office.Writer/Cursor/Option" = {
              ProtectedArea = true;
            };

            "/org.openoffice.Office.Writer/FmtAidsAutocomplete" = {
              EncloseWithCharacters = false;
            };

            "/org.openoffice.Office.Writer/Grid/Resolution" = {
              XAxis = 1000;
              YAxis = 1000;
            };

            "/org.openoffice.Office.Writer/Grid/Subdivision" = {
              XAxis = 3;
              YAxis = 3;
            };

            "/org.openoffice.Office.Writer/Layout/Other" = {
              ApplyCharUnit = true;
              IsAlignMathObjectsToBaseline = true;
              IsSquaredPageMode = true;
              MeasureUnit = 2;
            };

            "/org.openoffice.Office.Writer/Layout/ViewLayout" = {
              BookMode = false;
              Columns = 1;
            };

            "/org.openoffice.Office.Writer/Layout/Window" = {
              HorizontalRuler = true;
              HorizontalScroll = true;
              ShowRulers = true;
              ShowScrollBarTips = true;
              VerticalRuler = false;
              VerticalScroll = true;
            };

            "/org.openoffice.Office.Writer/Layout/Zoom" = {
              Type = 0;
              Value = 100;
            };

            "/org.openoffice.Setup/L10N" = {
              DateAcceptancePatterns = "D.M.;D/M/;D.M.Y";
              DecimalSeparatorAsLocale = true;
              ooLocale = "en-US";
              ooSetupSystemLocale = "ru-RU";
            };

            "/org.openoffice.Setup/Office" = {
              ooSetupInstCompleted = true;
            };

            "/org.openoffice.Setup/Office/Factories/org.openoffice.Setup:Factory['com.sun.star.presentation.PresentationDocument']" =
              {
                ooSetupFactoryDefaultFilter = "Impress MS PowerPoint 2007 XML";
              };

            "/org.openoffice.Setup/Office/Factories/org.openoffice.Setup:Factory['com.sun.star.sheet.SpreadsheetDocument']" =
              {
                ooSetupFactoryDefaultFilter = "Calc Office Open XML";
              };

            "/org.openoffice.Setup/Office/Factories/org.openoffice.Setup:Factory['com.sun.star.text.TextDocument']" =
              {
                ooSetupFactoryDefaultFilter = "Office Open XML Text";
              };
          };
        };
      };
  };
}
