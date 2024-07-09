unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TForm3 = class(TForm)
    qckrp1: TQuickRep;
    rbPageHeaderPageHeaderBand1: TQRBand;
    rbPageHeaderDetailBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrdbtxtid: TQRDBText;
    qrdbtxtnik: TQRDBText;
    qrdbtxtnama: TQRDBText;
    qrdbtxttelp: TQRDBText;
    qrdbtxtemail: TQRDBText;
    qrdbtxtalamat: TQRDBText;
    rbPageHeaderTitleBand1: TQRBand;
    qrdbtxtmember: TQRDBText;
    qrlbl2: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl4: TQRLabel;
    qrlbl5: TQRLabel;
    qrlbl6: TQRLabel;
    qrlbl7: TQRLabel;
    qrlbl8: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses
  Unit2;

{$R *.dfm}

end.
