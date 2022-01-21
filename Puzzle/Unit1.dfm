object Form1: TForm1
  Left = 48
  Top = 184
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Puzzle'
  ClientHeight = 316
  ClientWidth = 960
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnHide = FormHide
  OnMouseDown = FormMouseDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
  end
  object MainMenu1: TMainMenu
    Left = 40
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object N7: TMenuItem
      Caption = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
      OnClick = N7Click
    end
    object N6: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      OnClick = N6Click
    end
    object N4: TMenuItem
      Caption = #1056#1072#1079#1084#1077#1088
      object N221: TMenuItem
        Caption = '2'#1093'2'
        OnClick = N221Click
      end
      object N441: TMenuItem
        Caption = '4'#1093'4'
        OnClick = N441Click
      end
      object N881: TMenuItem
        Caption = '8'#1093'8'
        OnClick = N881Click
      end
    end
    object N5: TMenuItem
      Caption = #1048#1089#1093#1086#1076#1085#1086#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      OnClick = N5Click
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 72
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 104
  end
end
