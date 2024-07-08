unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    edt2: TEdit;
    lbl3: TLabel;
    edt3: TEdit;
    lbl4: TLabel;
    edt4: TEdit;
    lbl5: TLabel;
    edt5: TEdit;
    lbl6: TLabel;
    btn1: TButton;
    lbl7: TLabel;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    dbgrd1: TDBGrid;
    chk1: TCheckBox;
    chk2: TCheckBox;
    lbl8: TLabel;
    lbl9: TLabel;
    pnl1: TPanel;
    procedure btn1Click(Sender: TObject);
    procedure posisiAwal;
    procedure FormShow(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: String;
  SearchText: String;

implementation

uses
  Unit2;

{$R *.dfm}

procedure TForm1.posisiAwal;
begin
btn3.Enabled:=false;
btn4.Enabled:=false;
btn5.Enabled:=false;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
//declare SearchText: string; di bagian VAR lalu copas kodingnya
  //perhatikan nama tabel dan kolomnya yang ingin di cari, lihati comment selanjutnya
  SearchText := Trim(edt1.Text);

  if SearchText = '' then
  begin
    ShowMessage('Masukkan teks untuk melakukan pencarian.');
    Exit;
  end;

  DataModule2.zqry1.Close;
  DataModule2.zqry1.SQL.Clear;
  //ingat ganti SELECT*FROM namatabel WHERE namakolom
  DataModule2.zqry1.SQL.Add('SELECT * FROM KUSTOMER WHERE NIK LIKE :SearchText');
  DataModule2.zqry1.ParamByName('SearchText').AsString := '%' + SearchText + '%';
  DataModule2.zqry1.Open;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
posisiAwal;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
posisiAwal;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
btn3.Enabled:=true;
btn4.Enabled:=true;
btn5.Enabled:=true;
end;

procedure TForm1.chk1Click(Sender: TObject);
begin
  if chk1.Checked then
  begin
    chk2.Checked:=false;
    lbl9.Caption:='5%';
  end;
end;

procedure TForm1.chk2Click(Sender: TObject);
begin
if chk2.Checked then
  begin
    chk1.Checked:=false;
    lbl9.Caption:='TIDAK ADA DISKON';
  end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
if (edt1.Text = '') and (edt2.Text ='') and (edt3.Text = '') and (edt4.Text = '') and (edt5.Text = '') and
(edt5.Text = '') then
  begin
    ShowMessage('Masukkan teks');
    Exit;
  end else
  if DataModule2.Zqry1.Locate('nik', edt1.Text, []) then
  begin
    ShowMessage('Data Dengan nik ' + edt1.Text + ' Sudah Ada Didalam Sistem');
  end else
  begin
    DataModule2.zqry1.SQL.Clear;
    DataModule2.zqry1.SQL.Add('INSERT INTO kustomer (id, nik, nama, telp, email, alamat, member) VALUES (:id, :nik, :nama, :telp, :email, :alamat, :member)');
    DataModule2.zqry1.ParamByName('id').AsString := a;
    DataModule2.zqry1.ParamByName('nik').AsString := edt1.Text;
    DataModule2.zqry1.ParamByName('nama').AsString := edt2.Text;
    DataModule2.zqry1.ParamByName('telp').AsString := edt3.Text;
    DataModule2.zqry1.ParamByName('email').AsString := edt4.Text;
    DataModule2.zqry1.ParamByName('alamat').AsString := edt5.Text;
    if chk1.Checked then
    begin
      DataModule2.zqry1.ParamByName('member').AsString := chk1.Caption;
    end else
    begin
      DataModule2.zqry1.ParamByName('member').AsString := chk2.Caption;
    end;
    DataModule2.zqry1.ExecSQL;

    DataModule2.zqry1.SQL.Clear;
    DataModule2.zqry1.SQL.Add('SELECT * FROM kustomer');
    DataModule2.zqry1.Open;
    ShowMessage('Data berhasil disimpan');
  end;
  posisiAwal;

end;

procedure TForm1.btn7Click(Sender: TObject);
begin
edt1.Text:='';
edt2.Text:='';
edt3.Text:='';
edt4.Text:='';
edt5.Text:='';
chk1.Checked:=false;
chk2.Checked:=false;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
if edt1.Text = '' then
  begin
    ShowMessage('NIK Tidak Boleh Kosong!');
  end else
  begin
    DataModule2.zqry1.SQL.Clear;
    DataModule2.zqry1.SQL.Add('UPDATE kustomer SET nik = :nik, nama = :nama, telp = :telp, email = :email, alamat = :alamat, member = :member WHERE Id = :id');
    DataModule2.zqry1.ParamByName('nik').AsString := edt1.Text;
    DataModule2.zqry1.ParamByName('nama').AsString := edt2.Text;
    DataModule2.zqry1.ParamByName('telp').AsString := edt3.Text;
    DataModule2.zqry1.ParamByName('email').AsString := edt4.Text;
    DataModule2.zqry1.ParamByName('alamat').AsString := edt5.Text;
    if chk1.Checked then
    begin
      DataModule2.zqry1.ParamByName('member').AsString := chk1.Caption;
    end else
    begin
      DataModule2.zqry1.ParamByName('member').AsString := chk2.Caption;
    end;
    DataModule2.zqry1.ParamByName('id').AsString := a; // Assuming 'a' is the ID value
    DataModule2.zqry1.ExecSQL;

    // Clear the SQL statement before executing the SELECT query
    DataModule2.zqry1.SQL.Clear;
    DataModule2.zqry1.SQL.Add('SELECT * FROM kustomer');
    DataModule2.zqry1.Open;
    ShowMessage('Data berhasil diupdate');
  end;
  posisiAwal;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
  edt1.Text := UpperCase(DataModule2.zqry1.Fields[1].AsString);
  edt2.Text := UpperCase(DataModule2.zqry1.Fields[2].AsString);
  edt3.Text := UpperCase(DataModule2.zqry1.Fields[3].AsString);
  edt4.Text := UpperCase(DataModule2.zqry1.Fields[4].AsString);
  edt5.Text := UpperCase(DataModule2.zqry1.Fields[5].AsString);
  if DataModule2.zqry1.Fields[6].AsString = 'YA' then
  begin
    chk1.Checked := True;
    chk2.Checked := False;
  end
  else
  begin
    chk1.Checked := False;
    chk2.Checked := True;
  end;
  a := DataModule2.zqry1.Fields[0].AsString;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda Yakin Menghapus Data ini', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    with DataModule2.zqry1 do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM kustomer WHERE id = ''' + a + '''');
      ExecSQL;

      SQL.Clear;
      SQL.Add('SELECT * FROM kustomer');
      Open;
      ShowMessage('Data berhasil dihapus');
    end;
  end;
  posisiAwal;
end;

end.
